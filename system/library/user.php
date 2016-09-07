<?php
class User {
	private $soap;
	private $user_id;
	private $username;
	private $firstname;
	private $lastname;
	private $email;
	private $permission = array();

	public function __construct($registry) {
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');
		$this->config = $registry->get('config');

		if (isset($this->session->data['user_id'])) {
			$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$this->session->data['user_id'] . "' AND status = '1'");

			if ($user_query->num_rows) {
				$this->user_id = $user_query->row['user_id'];
				$this->username = $user_query->row['username'];
				$this->email = $user_query->row['email'];
				$this->firstname = $user_query->row['firstname'];
				$this->lastname = $user_query->row['lastname'];
				$this->user_group_id = $user_query->row['user_group_id'];

				$this->db->query("UPDATE " . DB_PREFIX . "user SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE user_id = '" . (int)$this->session->data['user_id'] . "'");

				$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");

				$permissions = unserialize($user_group_query->row['permission']);

				if (is_array($permissions)) {
					foreach ($permissions as $key => $value) {
						$this->permission[$key] = $value;
					}
				}
			} else {
				$this->logout();
			}
		}
	}

	public function login($username, $password) {
		$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE username = '" . $this->db->escape($username) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1'");

		if ($user_query->num_rows) {
			$this->session->data['user_id'] = $user_query->row['user_id'];

			$this->user_id = $user_query->row['user_id'];
			$this->username = $user_query->row['username'];
			$this->user_group_id = $user_query->row['user_group_id'];

			$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");

			$permissions = unserialize($user_group_query->row['permission']);

			if (is_array($permissions)) {
				foreach ($permissions as $key => $value) {
					$this->permission[$key] = $value;
				}
			}
/*
			if (!$this->config->get('config_maintenance')) {
				$server_url = "http://troycontainerline.com/sugar/soap.php?wsdl";
				
				$credentials = array('user_name' => $username, 'password' => md5($password));
			
				$sugar_client = new SoapClient($server_url, TRUE);
				
				$proxy = $sugar_client->getProxy();
				
				if ($proxy) {
					$result = $proxy->login($credentials, 'LCL');
					$this->session->data['sugar_session_id'] = $result['id'];
				}
			}		
*/		
			return true;
		} else {
			return false;
		}
	}

	public function logout() {
		unset($this->session->data['user_id']);

		$this->user_id = '';
		$this->username = '';
	}

	public function hasPermission($key, $value) {
		if (isset($this->permission[$key])) {
			return in_array($value, $this->permission[$key]);
		} else {
			return false;
		}
	}

	public function isLogged() {
		return $this->user_id;
	}

	public function getId() {
		return $this->user_id;
	}

	public function getUserName() {
		return $this->username;
	}
	
	public function getUserEmail() {
		return $this->email;
	}
	 
	public function getFirstName() {
		return $this->firstname;
	}
	 
	public function getLastName() {
		return $this->lastname;
	}
	public function getEmail() {
		return $this->email;
	}
	
	public function getGroupId() {
		return $this->user_group_id;
	}	
	
	function UserManagement(){
		// here goes your sugar installation address
		$this->soap=new SugarSoap('http://troycontainerline.com/sugar/soap.php?wsdl');
	}
	
	function authenticate($email,$password){
		$result=$this->soap->getContacts(" contacts_cstm.can_login_c='1'
                                                and contacts.email1='".$email."'
                                                and contacts_cstm.password_c='".$password."'",
				1,"");
		if($result['result_count']>0){
			// Authenticated
			// transform return values into an associative array
			$result=$this->soap->nameValuePairToSimpleArray(
					$result['entry_list'][0]['name_value_list']);
			/**
			 *       Here we can add code for managing the authenticated user,
			 *       for example put some user data in a session variable
			 *       (id, first and last name, email etc.)
			 *       Something like this:
			**/
			$_SESSION['user_data']=$result;
			return true;
		} else{
			// Not authenticated
			/**
			 *       and here we can add code for managing the authentication error,
			 *       for example a notification email to someone
			 **/
			return false;
		}
	}
	
	
}