<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name',255)->nullable();
            $table->string('image',255)->nullable();
            $table->string('alias',50)->nullable();
            $table->bigInteger('price')->nullable();
            $table->integer('qty')->nullable();
            $table->longText('detail')->nullable();
            $table->string('description',255);
            $table->string('list_images',255);
            $table->integer('id_type');
            $table->integer('id_category');
            $table->integer('id_supplier');
            $table->integer('id_brand');
            $table->integer('barcode');
            $table->string('meta_key',255);
            $table->string('meta_desc',255);
            $table->string('img_social',255);
            $table->integer('status');
            $table->timestamps('date_create');
            $table->timestamps('date_update');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}