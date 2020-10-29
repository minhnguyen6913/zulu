<?php
namespace App\Controllers\Backend\Image;

use App\Controllers\BackendController;
use App\Models\Backend\Image\ImageModel;

class Image extends BackendController
{
    private $mod_image;
    function __construct()
    {
        $this->pathRoot = site_url() . 'backend/image/';
        $this->upload_url = '/uploads/images/';
        $this->upload_path = './uploads/images/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('upload_url', $this->upload_url);
        $this->mod_image = new ImageModel();
    }

    public function index()
    {
        $id = $this->request->getVar('id');
        $list = $this->mod_image->__get_images($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('list', $list);
        return service('SmartyEngine')->view('backend/image/image.tpl');
    }

    public function add()
    {
        $category_id = $this->request->getVar('id');
        $arr_ext = array('jpg', 'jpeg', 'png', 'gif', 'tif', 'tiff', 'bmp');
        $files = $this->request->getFiles();
        $file = $files['file'];
        $ext = $file->getExtension();
        if (in_array(strtolower($ext), $arr_ext)) {
            $file_name = $file->getName();
            $new_file_name = uniqid().'.' . $ext;
            $name = basename($file_name, '.' . $ext);
            $path= $this->upload_path.$category_id."/";
            $file->move($path, $new_file_name);
            $data_insert = array(
                'category_id' => $category_id,
                'name' => $name,
                'src' => $new_file_name
            );
            $id = $this->mod_image->insert($data_insert);
            $new_file_basename = basename($new_file_name, '.' . strtolower($ext));
            $image = service('image');
            $image ->withFile($path. $new_file_name)
                ->fit(100, 100, 'center')
                ->save($path . $new_file_basename . '_thumbnail.' . strtolower($ext));
            $image ->withFile($path. $new_file_name)
                ->resize(960, 614, false, 'height')
                ->save($path . $new_file_basename . '_960x614.' . strtolower($ext));
            $image ->withFile($path. $new_file_name)
                ->resize(100, 71, false, 'height')
                ->save($path . $new_file_basename . '_100x71.' . strtolower($ext));
            $image ->withFile($path. $new_file_name)
                ->resize(290, 188, false, 'height')
                ->save($path . $new_file_basename . '_290x188.' . strtolower($ext));
        }
    }
    public function delete()
    {
        $id = $this->request->getVar('id');
        $image = $this->mod_image->__get_image($id);
        if ($image) {
            unlink($this->upload_path.$image['category_id']."/".$image['src']);
            $this->mod_image->__delete($id);
        }
        echo '1';
    }

}
