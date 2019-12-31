<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\cart;
use App\Models\cartdetail;
use Illuminate\Http\Request;
use App\Models\productcategory;
use App\Models\products;
use PhpParser\Node\Stmt\Else_;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
class cartcontroller extends Controller
{
    public function index()
    {
        if(session('giohang'))
            return view('frontend.cart.index');
        else
            return view('frontend.cart.empty');
    }


    public function addto($id)
    {
        //tao gio hàng(ss)
       //session(['giohang'=>[]]);
        $giohang = session('giohang');
        //tien hanh them san pham dang mua vao gio
        $item = products::where(['id'=>$id,'status'=>1])->where('qty','>',0)->first();
        if($item)
        {
            if(isset($giohang[$id]))
            {
                $giohang[$id]['qty']++;
            }else{
                $itemincart = [
                    'id'=> $item->id,
                    'name'=> $item->name,
                    'price'=> $item->price,
                    'img'=> $item->image,
                    'real_qty'=> $item->qty,
                    'qty'=>1
                ];
                $giohang[ $item->id] = $itemincart;
            }
            session(['giohang'=>$giohang]);
            return  redirect()->route('cart.index');
        }else
            return  redirect()->route('homepage.index');

    }
    public function update(Request $rq)
    {
        $giohang = session('giohang');
        foreach($rq->qty as $id=>$qty)
        {
            $giohang[$id]['qty']= $qty;
        }
        session(['giohang'=>$giohang]);
        return  redirect()->route('cart.index');

    }
    public function deleteitem($id)
    {
        $giohang = session('giohang');
        unset($giohang[$id]);
        session(['giohang'=>$giohang]);
        return  redirect()->route('cart.index')->with(['msg'=>'xoa thanh công','type'=>'success']);
    }
    //don hang
    public function checkout()
    {
        return view('frontend.cart.checkout');
    }
    public function checkoutPOST(Request $rq)
    {
        //dd($rq->all());
        //tao don hang
        $code = Str::random(5);
        $orderid = cart::where('id_bill','!=',$code)->insertGetId([
            "info_name" => $rq->info_name,
            "info_email" => $rq->info_email,
            "info_phone" => $rq->info_phone,
            "info_address" => $rq->info_address,
            "info_name2" =>  $rq->info_name2,
            "info_email2" => $rq->info_email2,
            "info_phone2" => $rq->info_phone2,
            "info_address2" => $rq->info_address2,
            "payment" => $rq->thanhtoan,
            'feeshipping'=>session('feeship'),
            'id_bill'=>$code,
            'date_order'=>now(),
            'total'=>session('total'),
            'status'=>1
        ]);
        //them chi tiet
        foreach(session('giohang') as $item)
            cartdetail::insert([
                'id_cart'=>$orderid,
                'id_product'=>$item['id'],
                'qty'=>$item['qty'],
                'price'=>$item['price']
            ]);
        //gui mail
        //gui mail theo kieu tu bien soan noi dung ngay tai vi tri code
        Mail::raw('ban vua dat hang ma so: '.$code, function ($message) use($rq,$code) {
            $message->from('minhtuanytdp@gmail.com', 'tuan dep trai');
           /// $message->sender('john@johndoe.com', 'John Doe');
            $message->to($rq->info_email,$rq->info_name);
            //$message->cc('john@johndoe.com', 'John Doe');
            //$message->bcc('john@johndoe.com', 'John Doe');
            //$message->replyTo('john@johndoe.com', 'John Doe');
            $message->subject('Thong tin dat hang '.$code);
            //$message->priority(3);
            //$message->attach('pathToFile');
        });
        //gui mail theo kieu noi thiet ke thong qua view
        // Mail::send('Html.view', $data, function ($message) {
        //     $message->from('john@johndoe.com', 'John Doe');
        //     $message->sender('john@johndoe.com', 'John Doe');
        //     $message->to('john@johndoe.com', 'John Doe');
        //     $message->cc('john@johndoe.com', 'John Doe');
        //     $message->bcc('john@johndoe.com', 'John Doe');
        //     $message->replyTo('john@johndoe.com', 'John Doe');
        //     $message->subject('Subject');
        //     $message->priority(3);
        //     $message->attach('pathToFile');
        // });
        //dua he thong ve lai trang thai ban dau chua mua hang
        session(['giohang'=>[]]);
        return  redirect()->route('cart.alert')->with(['code'=>$code]);
    }
    public function thankyou()
    {
        return view('frontend.cart.thankyou');
    }
    public function testm()
    {
        Mail::raw('ban vua dat hang ma so: ', function ($message)  {
            $message->from('minhtuanytdp@gmail.com', 'tuan dep trai');
           /// $message->sender('john@johndoe.com', 'John Doe');
            $message->to('minhtuanytdp@gmail.com','tuan dep trai 2');
            //$message->cc('john@johndoe.com', 'John Doe');
            //$message->bcc('john@johndoe.com', 'John Doe');
            //$message->replyTo('john@johndoe.com', 'John Doe');
            $message->subject('Thong tin dat hang ');
            //$message->priority(3);
            //$message->attach('pathToFile');
        });
    }
}