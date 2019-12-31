<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\category;
use Faker\Generator as Faker;

$factory->define(category::class, function (Faker $faker) {
    return [
        'name'=>$faker->name,
        'parent_id'=>rand(1,10),
        'status'=>rand(0,2)
    ];
});
