<?php
namespace App\Controllers\Backend\Blog;

use App\Controllers\BackendController;
use App\Models\Backend\Blog\CategoryModel;
use App\Models\Backend\Blog\DocumentModel;

class Document extends BackendController
{
    private $documentModel;
    private $imageRoot;
    private $categoryModel;

    public function __construct() 
    {
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        $this->pathRoot = site_url().'backend/blog/';
        $this->upload_path = './uploads/blog/document/';
        $this->upload_url = '/uploads/blog/document/';
        service('SmartyEngine')->assign('upload_url', $this->upload_url);
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->categoryModel = new CategoryModel();
        $this->documentModel = new documentModel();
        helper('text');
    }
	public function ajax_list() {
        if ($this->request->isAJAX()) {
            $category_id = $this->request->getVar('category_id');
            if(isset($category_id))$this->documentModel->category_id = $category_id;
            $list = $this->documentModel->_getDatatables();
            $data = array();
            $no = @$_POST['start'];

            foreach ($list as $item) {
                $row = array();
                $row[] = ++ $no;
                $button = '';
                $button .= '<button class="btn btn-xs btn-info" onclick="_edit(' . $item->id . ')" data-toggle="tooltip" title="Sửa"><i class="fa fa-pencil"></i></button> ';
                $button .= '<button class="btn btn-xs btn-danger" onclick="_delete(' . $item->id . ')" data-toggle="tooltip" title="Xóa"><i class="fa fa-trash-o"></i></button> ';
                $row[] = "<div style='text-align:center'>{$button}</div>";
                $href = $this->pathRoot.'document/detail?id='.$item->id;
                $row[] = "<a href='{$href}'>" . $item->name . "</a>";
                $data[] = $row;
            }
            $output = array(
                "draw" => @ $_POST['draw'],
                "recordsTotal" => $this->documentModel->_countAll(),
                "recordsFiltered" => $this->documentModel->_countFiltered(),
                "data" => $data,
            );
            echo json_encode($output);
        }
    }
    public function ajax_add(){
        if ($this->request->isAJAX()) {
            $input = json_decode($this->request->getPost('form'), true);
            $files = $this->request->getFiles();
            $no = 0;
            if ($files) {
                foreach ($files['files'] as $file) {
                    $ext = $file->getExtension();
                    $file_name = $file->getName();
                    $new_file_name = uniqid().'.' . $ext;
                    $name = basename($file_name, '.' . $ext);
                    $path= $this->upload_path;
                    if (file_exists($path.$new_file_name)) {
                        unlink($path.$new_file_name);
                    }
                    $file->move($path, $new_file_name);
                    $file_data[] = array(
                        'name' => ($input['file_name'][$no] != '') ? $input['file_name'][$no] : $name,
                        'src' => $new_file_name,
                    );
                    $no++;
                }
                $upload = json_encode($file_data);
            } else {
                $upload = null;
            }

            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            // Validate

            $validate = $this->documentModel->_checkUnique('document', 'name', $input['name']);
            if ($validate) {
                echo '0';die;
            }
            $data_insert = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'category_id' => $input['category_id'],
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'intro' => $input['intro'],
                'file' => $upload,
            );
            $document_id = $this->documentModel->_insertData($data_insert);
            if (isset($input['tag'])) {
                if ($document_id && (count($input['tag']) > 0 )) {
                    foreach ($input['tag'] as $item) {

                        $tag_slug = url_title(convert_accented_characters($item), '-', true);

                        $tag_id = $this->documentModel->_checkTag($tag_slug);


                        if (!$tag_id) {
                            $inset_tag = array(
                                'name' => $item,
                                'slug' => $tag_slug,
                            );
                            $tag_id = $this->documentModel->_insertTag($inset_tag);

                        }
                        $insert_tag_document = array(
                            'document_id' => $document_id,
                            'tag_id' => $tag_id
                        );
                        $check = $this->documentModel->_insertTagdocument($insert_tag_document);

                    }
                }
            }
            echo '1';
        }
        echo '0';
    }
    public function ajax_edit(){
        if ($this->request->isAJAX()) {
            $input = json_decode($this->request->getPost('form'), true);
            $id = $input['id'];
            //validate
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            $validate = $this->documentModel->_checkUnique('document', 'name', $input['name'], $id);

            if ($validate) {
                echo '0';die;
            }
            //database
            $document = $this->documentModel->_get($id);
            if ($document['file'] != '') {
                $old_files = json_decode($document['file'], true);
                $old_files = array_column($old_files, 'src');
            }
            $file_data = array();
            //old File Handle
            if (isset($input['file_upload_name'])) {
                $num = 0;
                foreach ($input['file_upload_name'] as $name) {
                    $file_data[$num]['name'] = $name;
                    $num++;
                }
            }
            if (isset($input['file_upload_src'])) {
                $file_delete = array_diff($old_files,$input['file_upload_src']);
                $num = 0;
                foreach ($input['file_upload_src'] as $src) {
                    $file_data[$num]['src'] = $src;
                    $num++;
                }
            } else {
                $file_delete = $old_files;
            }

            if ($file_delete) {
                foreach ($file_delete as $item) {
                    if (file_exists($this->upload_path.$item)) {
                        unlink($this->upload_path.$item);
                    }
                }
            }

            //File handle
            $files = $this->request->getFiles();
            if ($files) {
                $no = 0;
                foreach ($files['files'] as $file) {
                    $ext = $file->getExtension();
                    $file_name = $file->getName();
                    $new_file_name = uniqid().'.' . $ext;
                    $name = basename($file_name, '.' . $ext);
                    $path= $this->upload_path;
                    if (file_exists($path.$new_file_name)) {
                        unlink($path.$new_file_name);
                    }
                    $file->move($path, $new_file_name);
                    $file_data[] = array(
                        'name' => ($input['file_name'][$no] != '') ? $input['file_name'][$no] : $name,
                        'src' => $new_file_name,
                    );
                    $no++;
                }
            }
            $data = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'intro' => $input['intro'],
                'file' => (count($file_data) > 0) ? json_encode($file_data) : null,
            );
            $check = $this->documentModel->_updateData($id,$data);
            $document_id = $id;
            $this->documentModel->_deleteTagdocument($id);
            if (isset($input['tag'])) {
                if ($document_id && (count($input['tag']) > 0 )) {
                    foreach ($input['tag'] as $item) {

                        $tag_slug = url_title(convert_accented_characters($item), '-', true);

                        $tag_id = $this->documentModel->_checkTag($tag_slug);


                        if (!$tag_id) {
                            $inset_tag = array(
                                'name' => $item,
                                'slug' => $tag_slug,
                            );
                            $tag_id = $this->documentModel->_insertTag($inset_tag);

                        }
                        $insert_tag_document = array(
                            'document_id' => $document_id,
                            'tag_id' => $tag_id
                        );
                        $check = $this->documentModel->_insertTagdocument($insert_tag_document);

                    }
                }
            }
            echo '1';
        }
        echo '1';
    }
    public function ajax_delete(){

        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            // Validate
            $where = array(
                'id' => $input['id']
            );
            $check = $this->documentModel->_deleteData($where);
            echo $check;
        }
        echo '0';
    }
    public function getdocument() {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id');
            $document = $this->documentModel->_get($id);
            echo json_encode($document);
        }
    }
    public function add() 
    {
        $category_id = $this->request->getVar('category_id');

        $tag = $this->documentModel->_getTag();
        service('SmartyEngine')->assign('category_id', $category_id);
        service('SmartyEngine')->assign('tag', $tag);
        service('SmartyEngine')->assign('add', true);
        return service('SmartyEngine')->view('backend/blog/document/action.tpl');
    }
    public function edit() 
    {  
        $id = $this->request->getVar('id'); 
        $document = $this->documentModel->_get($id);
        if ($document['file'] != '') {
            $files = json_decode($document['file'], true);
        }
        $old_tag = $this->documentModel->_getTagdocument($id);
        $tag_document = array(0);
        if ($old_tag){
            $tag_document = array_column($old_tag, 'tag_id');
        }

        $tag = $this->documentModel->_getTag();
        foreach ($tag as $t) {

            if (in_array($t['id'],$tag_document)) {
                $t['checked'] = true;
            } else {
                $t['checked'] = false;
            }
            $data_tag[] = $t;
        }
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('files', $files);
        service('SmartyEngine')->assign('category_id', $document['category_id']);
        service('SmartyEngine')->assign('data', $document);
        service('SmartyEngine')->assign('tag', $data_tag);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/blog/document/action.tpl');
    }
    public function detail()
    {
        $id = $this->request->getVar('id');
        $document = $this->documentModel->_get($id);
        if ($document['file'] != '') {
            $files = json_decode($document['file'], true);
        }
        $old_tag = $this->documentModel->_getTagdocument($id);
        $tag_document = array(0);
        if ($old_tag){
            $tag_document = array_column($old_tag, 'tag_id');
        }

        $tag = $this->documentModel->_getTag();
        foreach ($tag as $t) {

            if (in_array($t['id'],$tag_document)) {
                $t['checked'] = true;
            } else {
                $t['checked'] = false;
            }
            $data_tag[] = $t;
        }
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $document);
        service('SmartyEngine')->assign('tag', $data_tag);
        service('SmartyEngine')->assign('files', $files);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/blog/document/detail.tpl');
    }
}
