<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\product;
use Faker\Generator as Faker;

$factory->define(product::class, function (Faker $faker) {
    return [
        'name'=>$faker->name,
        'cat_id'=>rand(1,10),
        'price'=>rand(1000000,10000000),
        'qty'=>rand(1,100),
        'image'=>$faker->name,
        'status'=>rand(0,2)
    ];
});
