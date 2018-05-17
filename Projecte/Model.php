<?php
/* MODEL */
Class Model extends CI_Model{

	public function __construct(){
		parent::__construct();
	}

	public function insert($from, $data)
	{
		$this->db->insert($from, $data);
	}

	public function select ($from, $select=null, $where=null, $order=null)
	{
		
	}
}
?>