<?php
namespace App\Models;
use CodeIgniter\Model;


class BaseModel extends Model
{
    public function _checkUnique($table, $field, $val, $id = false)
    {

        $fieldName = $field;
        $fieldVal = $val;
        if ($field == 'name') {
            $fieldName = 'slug';
            $fieldVal = url_title(convert_accented_characters($val), '-', true);
        }
        $db      = \Config\Database::connect();
        $builder = $db->table($table);
        $builder->where($fieldName, $fieldVal);
        if ($id) $builder->where('id !=', $id);
        $result   = $builder->get()->getResult();
        return ($result) ? true : false;
    }
}
