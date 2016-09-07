<?php
        require_once(DIR_SYSTEM . 'library/lib/nusoap.php');
        
        class SugarSoap{
        		//$server_url = "http://troycontainerline.com/sugar/soap.php?wsdl";
                var $proxy;
                var $sess;
                
                private $soap;
                private $user_id;
                private $username;
                             
                function SugarSoap($soap_url,$login=true){
                        $soapclient = new soapclient($soap_url,true);
                        $this->proxy = $soapclient->getProxy();
                        if($login) $this->login();
                }
                
                function login(){
                	 
                	$params = array(
                			'user_name' => 'ben',
                			'password'  =>  md5('troy'),
                			'version'   => '6.5.16'
                	);
                	$result = $this->proxy->login($params,'LCL');
                	$this->sess= $result['error']['number']==0 ? $result['id'] : null;
                	return $this->sess;
                }
                
                function sugar_login($username, $password){
                	
                	//$user_query = $this->db->query("SELECT * FROM oc_user WHERE user_id = '" . $this->session->data['user_id'] . "' AND status = '1'");
                	 
                	$params = array(
                			'user_name' => $user_query->row['username'],
                			'password'  => $password,
                			'version'   => '6.5.16'
                	);
                	$result = $this->proxy->login($params,'LCL');
                	$this->sess= $result['error']['number']==0 ? $result['id'] : null;
                	return $this->sess;
                }     
                
                function getContacts($use_query){
                	
                	$query= "contacts.id IN (select contacts.id from contacts as contacts
                			left join contacts_cstm as custom on custom.id_c = contacts.id join email_addr_bean_rel as emailbean on emailbean.bean_id = contacts.id
                			where custom.custcode_c = '".$use_query."' )";
                	                	
                	$maxnum=0;
                	$orderby=' contacts.last_name asc';
                	$result = $this->proxy->get_entry_list(
                			$this->sess,
                			'Contacts',
                			$query,
                			$orderby,
                			0,
                			array(
                					'id',
                					'first_name',
                					'last_name',
                					'account_name',
                					'account_id',
                					'email1',
                					'phone_work',
                					'custcode_c',
                					'phone_fax',
                					'primary_street_address'
                			),
                			$maxnum,
                			0
                	);
                	return $result;
                }
                
                function checkContact($data){
                	$query2= "contacts.id IN (select contacts.id from contacts as contacts
                			left join contacts_cstm as custom on custom.id_c = contacts.id join email_addr_bean_rel as emailbean on emailbean.bean_id = contacts.id
                			where contacts.first_name ='".$data['first_name']."' and contacts.last_name = '".$data['last_name']."' and contacts.deleted = '0' and 
                			custom.custcode_c = '".$data['custcode_c']."' )";
                	
                	$maxnum=0;
                	$orderby=' contacts.last_name asc';
                	$result = $this->proxy->get_entry_list(
                			$this->sess,
                			'Contacts',
                			$query2,
                			$orderby,
                			0,
                			array('id','first_name','last_name'),
                			$maxnum,
                			0
                		);
                	
                	
                	if($result['result_count']<1){
                		return true;
                	} else{
                		return false;
                	}
                		
                }
                
                function nameValuePairToSimpleArray($array){
                	$my_array=array();
                	while(list($name,$value)=each($array)){
                		$my_array[$value['name']]=$value['value'];
                	}
                	return $my_array;
                }

                /**
                 *       Modify sugar entry with given data(used by other set### functions)
                 *
                 **/
                function setEntry($module,$array){
                	$data_array=array();
                	while(list($name,$value)=each($array)){
                		$data_array[]= array(
                				'name'  =>      $name,
                				'value' =>      $value
                		);
                	}
                	$result = $this->proxy->set_entry(
                			$this->sess,
                			$module,
                			$data_array
                	);
                	return $result;
                }
                
                function setContact($array){
                	return $this->setEntry("Contacts",$array);
                }
                
                function createUser($email,$password){
                	return $this->soap->setContact(array(
                			"email1"        => $email,
                			"password_c"    => $password
                	));
                }
                
                
        }
?>  