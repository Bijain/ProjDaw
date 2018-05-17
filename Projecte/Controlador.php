<?php
Class Controlador extends CI_Controller{

	public function __construct()
    {
        parent::__construct();
        $this->load->helper('form');
		$this->load->library('session', 'email', 'form_validation');
    }

    public function index()
    {
    	$this->load->view('index');
    }

    /*LogIn per usuaris*/
    public function logIn()
    {
        $this->form_validation->set_rules('emailI', 'Email', 'required|valid_email|max_length[50]',
            array('required' => 'Obligatori',
                  'valid_email' => '%s incorrecte'
            )
        );
        $this->form_validation->set_rules('constrasenyaI1', 'Password1', 'required',
            array('required' => 'Obligatori'
            )
        );
        $this->form_validation->set_rules('constrasenyaI2', 'Password2', 'required|matches[constrasenyaI1]',
            array('required' => 'Obligatori',
                  'matches' => 'La contrasenya no coincideix'
            )
        );
    }

    /*Resgistrarse per usuaris*/
    public function signUp()
    {
        $this->form_validation->set_rules('nomR', 'Nom', 'required|max_length[20]', 
            array('required' => 'Obligatori',
                  'max_length' => 'Massa llarg'
            )
        );
        $this->form_validation->set_rules('cognomR', 'Cognom', 'required|max_length[20]', 
            array('required' => 'Obligatori',
                  'max_length' => 'Massa llarg'
            )
        );
        $this->form_validation->set_rules('emailR', 'Email', 'required|valid_email|max_length[50]',
            array('required' => 'Obligatori',
                  'valid_email' => '%s incorrecte'
            )
        );
        $this->form_validation->set_rules('dniR', 'DNI', 'required|max_length[9]|min_length[9]',
            array('required' => 'Obligatori',
                  'max_length' => 'Tamany %s incorrecte',
                  'min_length' => 'Tamany %s incorrecte'
            )
        );
        $this->form_validation->set_rules('constrasenyaR1', 'Password1', 'required',
            array('required' => 'Obligatori'
            )
        );
        $this->form_validation->set_rules('constrasenyaR2', 'Password2', 'required|matches[constrasenyaR1]',
            array('required' => 'Obligatori',
                  'matches' => 'La contrasenya no coincideix'
            )
        );

        if($this->form_validation->run() == false)
        {
            $this->load->view('index');
        }
        else
        {/*validar dni i compte bancari js*/
            $nom = $this->input->post('nomR');
            $cognom = $this->input->post('cognomR');
            $email = $this->input->post('emailR');
            $dni = $this->input->post('dniR');
            $compteBancari = $this->input->post('compteBancariR');
            $password = $this->input->post('contrasenyaR1');

            $this->load->model('Model');
            $from = 'client';
            $data = array(
                        'Nom' => $nom,
                        'Cognom' => $cognom,
                        'Password' => $password,
                        'Email' => $email,
                        'DNI' => $dni,
                        'CompteBancari' => $compteBancari
            );
            $this->Model->insert($from, $data);
        }
}
?>