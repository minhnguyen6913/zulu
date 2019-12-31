<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\brands;
use App\Models\productcategory;
use App\Models\products;
use App\Models\producttype;
use App\Models\suppliers;
use Illuminate\Http\Request;
class sanphamcontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ds = products::join('producttype','products.id_type','=','producttype.id')
        ->select('products.*', 'producttype.name as loaisp')
        ->where('products.status','!=',0)
        ->orderBy('id', 'asc')
        ->paginate(10);
        //dd($ds);
        return view('backend.sanpham.index',['ds'=>$ds]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $cats = productcategory::select('id','name')->get();
        $sups  = suppliers::select('id','name')->get();
        $types = producttype::select('id','name')->get();
        $brands = brands::select('id','name')->get();

        return view('backend.sanpham.form',[
            'title'=>'Thêm sản phẩm',
            'button'=>'Thêm',
            'cats'=>$cats,
            'sups'=>$sups,
            'types'=>$types,
            'brands'=>$brands,
            'linkaction'=> route('sanpham.store'),
            'method'=>'POST',
            'breadcrumb'=> route('sanpham.index'),
            'namepage' => 'Sản phẩm'
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ],[
            'name.required' => 'Tên sản phẩm không được để trống',
            'image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'name'=>$request->name,
            'alias'=>$request->alias,
            'price'=>$request->price,
            'qty'=>$request->qty,
            'status'=>$request->status,
            'id_type'=>$request->id_type,
            'id_category'=>$request->id_category,
            'id_brand'=>$request->id_brand,
            'id_supplier'=>$request->id_supplier,
            'meta_key'=>$request->meta_key,
            'meta_desc'=>$request->meta_desc,
            'img_social'=>$request->img_social,
            'description'=>$request->description,
            'detail'=>$request->detail,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        );
        
        if($request->file('image')){
            $imagepath = public_path('/uploads/products/');
            $imagestore= '/public/uploads/products/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        if($request->file('img_social')){
            $imagepath = public_path('/uploads/products/');
            $imagestore= '/public/uploads/products/';
            $img_social = $this->imagehandle($request->file('img_social'),$imagepath,$imagestore);
            $data['img_social'] = $img_social;
        }
        
        // if($request->file('list_images')){
        //     $imagepath = public_path('/uploads/products/');
        //     $imagestore= '/public/uploads/products/';
        //     //$data['image'] = $image;
        //     $files = $request->file('list_images');
        
        //     foreach($files as $file){
        //         $list_images[] = $this->imagehandle($file,$imagepath,$imagestore);
        //     }
        //     $data['list_images'] = $list_images;
        // }

        products::insert($data);
        return redirect()->route('sanpham.index')->with(['msg'=>'Thêm thành công','type'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('backend.sanpham.detail');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = products::where('id',$id)
        ->where('status','!=',0)
        ->first();
        
        $cats = productcategory::select('id','name')->get();
        $sups  = suppliers::select('id','name')->get();
        $types = producttype::select('id','name')->get();
        $brands = brands::select('id','name')->get();
        return view('backend.sanpham.form',[
            'title'=>'Sửa sản phẩm',
            'button'=>'Cập nhật',
            'product'=>$product,
            'cats'=>$cats,
            'sups'=>$sups,
            'types'=>$types,
            'brands'=>$brands,
            'linkaction'=> route('sanpham.update',$product->id),
            'method'=>'PUT',
            'breadcrumb'=> route('sanpham.index'),
            'namepage' => 'Sản phẩm'
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = array(
            'name'=>$request->name,
            'alias'=>$request->alias,
            'price'=>$request->price,
            'qty'=>$request->qty,
            'status'=>$request->status,
            'id_type'=>$request->id_type,
            'id_category'=>$request->id_category,
            'id_brand'=>$request->id_brand,
            'id_supplier'=>$request->id_supplier,
            'meta_key'=>$request->meta_key,
            'meta_desc'=>$request->meta_desc,
            'description'=>$request->description,
            'detail'=>$request->detail,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('image')){
            $imagepath = public_path('/uploads/products/');
            $imagestore= '/public/uploads/products/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        if($request->file('img_social')){
            $imagepath = public_path('/uploads/products/');
            $imagestore= '/public/uploads/products/';
            $img_social = $this->imagehandle($request->file('img_social'),$imagepath,$imagestore);
            $data['img_social'] = $img_social;
        }
        
        // if($request->file('list_images')){
        //     $imagepath = public_path('/uploads/products/');
        //     $imagestore= '/public/uploads/products/';
        //     //$data['image'] = $image;
        //     $files = $request->file('list_images');
        
        //     foreach($files as $file){
        //         $list_images[] = $this->imagehandle($file,$imagepath,$imagestore);
        //     }
        //     $data['list_images'] = $list_images;
        // }
        $product = products::where('id',$id)
        ->where('status','!=',0)
        ->first();
        $date_create = $product->date_create;
        products::where('id',$id)->update($data);
        return redirect()->route('sanpham.index')->with(['msg'=>'Cập nhật thành công','type'=>'success']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        products::where('id',$id)
        ->update([
            'status'=> '0',
            'date_update'=>date('Y-m-d H:i:s')
        ]);
        return redirect()->route('sanpham.index')->with(['msg'=>'Xóa thành công','type'=>'success']);
    }
    //input $data = $request->file('image') // image is input class
    
}