
<?php  
// echo phpinfo();exit;

require_once( 'class.db.php' );
define( 'DB_HOST', 'localhost' ); // set database host 
define( 'DB_USER', 'root' );
define( 'DB_PASS', '' );
define( 'DB_NAME', 'aron_gestaoprojetos_app');



$database   = new DB(DB_HOST,DB_USER,DB_PASS,DB_NAME);
date_default_timezone_set('America/Sao_Paulo');

$database->autocommit(false);

// $sql = "SELECT * FROM usuario";
// if($database->num_rows($sql) > 0){
//     $results = $database->get_results($sql);
//     foreach ($results as $row) {
//         echo $row['email'];
//         echo "<br>";
//     }
// }
// exit;

$database->begin_transaction();

$insertarr1 = array('nome' => "Aron Scasdasdasdaapine", 'email' => 'aronscapine@gmail.com', 'senha' => md5("1234") );
$insert1 = $database->insert('usuario',$insertarr1);
$insertarr2 = array('nome' => "Jonaaa da Silvasdasda", 'email' => 'joao@gmail.com', 'senha' => md5("12344") );
$insert2 = $database->insert('usuario',$insertarr2);


if ($insert1 && $insert2)$database->commit();
else $database->rollback();



$sql = "SELECT * FROM usuario";
if($database->num_rows($sql) > 0){
    $results = $database->get_results($sql);
    foreach ($results as $row) {
        echo $row['nome'];
        echo "<br>";
    }
}
?>