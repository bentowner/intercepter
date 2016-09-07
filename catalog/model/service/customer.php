<?php

/**
 * @author Ben Towner
 * @name Customer - model - Service
 * @package LCL - Web application
 * @link http://www.TroyContainerLine.com/webapp/lcl
 */
class ModelServiceCustomer extends Model {

		public function addCustomer($data) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', newsletter = '" . (int)$data['newsletter'] . "', customer_group_id = '" . (int)$data['customer_group_id'] . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
			 
			$customer_id = $this->db->getLastId();
			 
			if (isset($data['address'])) {
				foreach ($data['address'] as $address) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($address['firstname']) . "', lastname = '" . $this->db->escape($address['lastname']) . "', company = '" . $this->db->escape($address['company']) . "', company_id = '" . $this->db->escape($address['company_id']) . "', tax_id = '" . $this->db->escape($address['tax_id']) . "', address_1 = '" . $this->db->escape($address['address_1']) . "', address_2 = '" . $this->db->escape($address['address_2']) . "', city = '" . $this->db->escape($address['city']) . "', postcode = '" . $this->db->escape($address['postcode']) . "', country_id = '" . (int)$address['country_id'] . "', zone_id = '" . (int)$address['zone_id'] . "'");
	
					if (isset($address['default'])) {
						$address_id = $this->db->getLastId();
							
						$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . $address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");
					}
				}
			}
		}
	
		public function editCustomer($customer_id, $data) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', newsletter = '" . (int)$data['newsletter'] . "', customer_group_id = '" . (int)$data['customer_group_id'] . "', status = '" . (int)$data['status'] . "' WHERE customer_id = '" . (int)$customer_id . "'");
	
			if ($data['password']) {
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE customer_id = '" . (int)$customer_id . "'");
			}
			 
			$this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");
			 
			if (isset($data['address'])) {
				foreach ($data['address'] as $address) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "address SET address_id = '" . (int)$address['address_id'] . "', customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($address['firstname']) . "', lastname = '" . $this->db->escape($address['lastname']) . "', company = '" . $this->db->escape($address['company']) . "', company_id = '" . $this->db->escape($address['company_id']) . "', tax_id = '" . $this->db->escape($address['tax_id']) . "', address_1 = '" . $this->db->escape($address['address_1']) . "', address_2 = '" . $this->db->escape($address['address_2']) . "', city = '" . $this->db->escape($address['city']) . "', postcode = '" . $this->db->escape($address['postcode']) . "', country_id = '" . (int)$address['country_id'] . "', zone_id = '" . (int)$address['zone_id'] . "'");
						
					if (isset($address['default'])) {
						$address_id = $this->db->getLastId();
	
						$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");
					}
				}
			}
		}
	
		public function editToken($customer_id, $token) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = '" . $this->db->escape($token) . "' WHERE customer_id = '" . (int)$customer_id . "'");
		}
	
		public function deleteCustomer($customer_id) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
			$this->db->query("DELETE FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");
			$this->db->query("DELETE FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "'");
			$this->db->query("DELETE FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$customer_id . "'");
			$this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");
		}
	
		
		
		public function getTotalAccounts($data = array()) {
			$sql = "SELECT COUNT(DISTINCT o.custkey) AS total FROM `lcl_cust` o WHERE o.custcode > '0' ";
		
			
			if (!empty($data['filter_date_start'])) {
				$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
			}
		
			if (!empty($data['filter_date_end'])) {
				$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
			}
		
			$query = $this->db->query($sql);
		
			return $query->row['total'];
		}
		public function getCustomerName($custcode) {
			$query = $this->db->query("SELECT DISTINCT CustName1 FROM lcl_cust WHERE CustCode = '" .$custcode . "' limit 1 ");
			
			$customername = 'Not Found';
			if ($query->num_rows) {
			$customername = $query->row['CustName1'];
			}
			
			return $customername;
		}
		
		public function getCustomerByEmail($email) {
			$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	
			return $query->row;
		}
		
		public function getCustomer($custcode) {
			$query = $this->db->query("SELECT * FROM lcl_cust WHERE CustCode = '" . $custcode . "'");
		
			return $query->row;
		}

		public function getCustKey($custcode) {
			$query = $this->db->query("SELECT CustName1 FROM lcl_cust WHERE CustCode = '" . $custcode . "'");
		
			return $query->row['CustName1'];
		}
		
		public function getCustomers($data) {
			$sql = "SELECT * FROM lcl_cust ";
	
			$implode = array();
			$sql .= " WHERE custkey NOT LIKE '%~%' and custkey NOT LIKE '%`%' and custsame is null "; 
			
			if (!empty($data['filter_custkey'])) {
				$implode[] = "custkey LIKE '%" . $this->db->escape($data['filter_custkey']) . "%'";
			}
	
			if (isset($data['filter_custcode']) && !is_null($data['filter_custcode'])) {
				$implode[] = "custcode LIKE '%" . (int)$data['filter_custcode'] . "'";
			}
			
			if (isset($data['filter_custstreet'])&& !is_null($data['filter_custstreet'])) {
				$implode[] = "CustStreet LIKE '%" . $this->db->escape($data['filter_custstreet']) . "%'";
			}
			
			if (isset($data['filter_custstate']) && !is_null($data['filter_custstate'])) {
				$implode[] = "CustState = '" . $this->db->escape($data['filter_custstate']) . "'";
			}
			
			if (isset($data['filter_custzip']) && !is_null($data['filter_custzip'])) {
				$implode[] = "CustZip LIKE '%" . $this->db->escape($data['filter_custzip']) . "%'";
			}
		
			if (!empty($data['filter_custtel']) && !is_null($data['filter_custtel'])) {
				$implode[] = "CustTel LIKE '%" . $this->db->escape($data['filter_custtel']) . "%'";
			}
			
			if (!empty($data['filter_custefax']) && !is_null($data['filter_custefax'])) {
				$implode[] = "CustEFax LIKE '%" . $this->db->escape($data['filter_custefax']) . "%'";
			}
	
			if (!empty($data['filter_custifax']) && !is_null($data['filter_custifax'])) {
				$implode[] = "CustIFax LIKE '%" . $this->db->escape($data['filter_custifax']) . "%'";
			}
			
			if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
				$implode[] = "CustSStat = '" . (int)$data['filter_status'] . "'";
			}	
			
			
	
			if ($implode) {
				$sql .= " AND " . implode(" AND ", $implode);
			}
	
			$sort_data = array(
						'custkey'   ,
						'custcode'   , 
						'custstreet' ,
						'custstate'  , 
						'custzip'    ,  
						'custtel'    , 
						'custefax'   , 
						'custifax'   
								);
				
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY CustName1";
			}
				
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
	
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}
	
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}
					
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
	
			$query = $this->db->query($sql);
	
			return $query->rows;
		}

		public function getCustomerRate($data){
			$sql = "select CustcType,custcladj,custcfact,custaddon,custaddtyp,custaddaamt from lcl_cust where custcode ='" . $data['customer']. "'";
			$customer_rate_query = $this->db->query($sql);
			
			return $customer_rate_query->row;
		}
		public function addContact_short($data){
		
		$sql = "INSERT INTO `troyweb`.`oc_customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `telephone`, `email`, `customer_group_id`, `date_added`, `custcode`) 
		VALUES (NULL, '0', '" . $data['first_name']. "', '" . $data['last_name']. "', '" . $data['phone_work']. "', '" . $data['email1']. "', '" . $data['custcode']. "', now(), '" . $data['custcode_c']. "')";

		$add_contact_query = $this->db->query($sql);
		
		$this->session->data['Contact_add_test'] = $sql;
		}
		
		public function addContact($data){
			$add_contact_query = "";
				
				
		}
		
		public function getContact($contact_id){
				$contact_query = $this->db->query("SELECT * FROM troy_contacts WHERE id = '" . (int)$contact_id . "'");
			
				if ($contact_query->num_rows) {
					$contact_id = $contact_query->row['id'];
					$customer_id = $contact_query->row['created_by'];
					$firstname = $contact_query->row['firstname'];
					$lastname =  $contact_query->row['lastname'];
					$email_address = '';
					$telephone =  $contact_query->row['phone_work'];
					$fax =  $contact_query->row['phone_fax'];
					$password = '';
					
					
					$web_contact_query = $this->db->query("select * from troy_email_addresses as e left join  
							troy_clients as c on c.custid = e.email_address_caps where CustID = '" . (int)$contact_query->row['id'] . "' group by Email");
					if ($web_contact_query->num_rows) {
						$lastname = $web_contact_query->row['Last Name'];
					}
					
					
					$email_query = $this->db->query("select email_address from troy_email_addresses WHERE id = '" . (int)$contact_query->row['id'] . "'");
					if ($email_query->num_rows) {
						$email = $email_query->row['email_address'];
					}
					
					
					
					return array(
							'contact_id'     => $contact_query->row['id'],
							'customer_id'    => $contact_query->row['created_by'],
							'firstname'      => $contact_query->row['firstname'],
							'lastname'       => $contact_query->row['lastname'],
							
							
					);
				}
			}

		public function getContacts($customer_id) {
			$contact_data = array();
		
			$query = $this->db->query("SELECT id FROM troy_contacts WHERE created_by = '" . (int)$customer_id . "'");
		
			foreach ($query->rows as $result) {
				$contact_info = $this->getContact($result['id']);
		
				if ($contact_info) {
					$contact_data[$result['contact_id']] = $contact_info;
				}
			}
		
			return $contact_data;
		}
		
		public function getContactList($data){
			$sql = "select email_address,last_name,phone_work,phone_fax from troy_contacts";
			
			$sql .= " where created_by = '".$data['customercode']." '";
			
			$implode = array();
			
			if (!empty($data['filter_name'])) {
				$implode[] = "last_name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
			}
			
			if (!empty($data['filter_custkey'])) {
				$implode[] = "custkey LIKE '%" . $this->db->escape($data['filter_custkey']) . "%'";
			}
			
			if ($implode) {
				$sql .= " AND " . implode(" AND ", $implode);
			}
			
			$sort_data = array(
					'email_address'   ,
					'last_name'   ,
					'phone_work' ,
					'phone_fax'  
			);
			

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " group by email_address";
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
			
			
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}
			
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}
					
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
			
			$query = $this->db->query($sql);
			$this->session->data['contactquery'] = $sql;
			return $query->rows;
		}
		
		public function approve($customer_id) {
			$customer_info = $this->getCustomer($customer_id);
	
			if ($customer_info) {
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET approved = '1' WHERE customer_id = '" . (int)$customer_id . "'");
	
				$this->language->load('mail/customer');
					
				$this->load->model('setting/store');
	
				$store_info = $this->model_setting_store->getStore($customer_info['store_id']);
					
				if ($store_info) {
					$store_name = $store_info['name'];
					$store_url = $store_info['url'] . 'index.php?route=account/login';
				} else {
					$store_name = $this->config->get('config_name');
					$store_url = HTTP_CATALOG . 'index.php?route=account/login';
				}
	
				$message  = sprintf($this->language->get('text_approve_welcome'), $store_name) . "\n\n";
				$message .= $this->language->get('text_approve_login') . "\n";
				$message .= $store_url . "\n\n";
				$message .= $this->language->get('text_approve_services') . "\n\n";
				$message .= $this->language->get('text_approve_thanks') . "\n";
				$message .= $store_name;
	
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setTo($customer_info['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($store_name);
				$mail->setSubject(html_entity_decode(sprintf($this->language->get('text_approve_subject'), $store_name), ENT_QUOTES, 'UTF-8'));
				$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				$mail->send();
			}
		}
	
		public function getAddress($address_id) {
			$address_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE address_id = '" . (int)$address_id . "'");
	
			if ($address_query->num_rows) {
				$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$address_query->row['country_id'] . "'");
					
				if ($country_query->num_rows) {
					$country = $country_query->row['name'];
					$iso_code_2 = $country_query->row['iso_code_2'];
					$iso_code_3 = $country_query->row['iso_code_3'];
					$address_format = $country_query->row['address_format'];
				} else {
					$country = '';
					$iso_code_2 = '';
					$iso_code_3 = '';
					$address_format = '';
				}
					
				$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$address_query->row['zone_id'] . "'");
					
				if ($zone_query->num_rows) {
					$zone = $zone_query->row['name'];
					$zone_code = $zone_query->row['code'];
				} else {
					$zone = '';
					$zone_code = '';
				}
	
				return array(
						'address_id'     => $address_query->row['address_id'],
						'customer_id'    => $address_query->row['customer_id'],
						'firstname'      => $address_query->row['firstname'],
						'lastname'       => $address_query->row['lastname'],
						'company'        => $address_query->row['company'],
						'company_id'     => $address_query->row['company_id'],
						'tax_id'         => $address_query->row['tax_id'],
						'address_1'      => $address_query->row['address_1'],
						'address_2'      => $address_query->row['address_2'],
						'postcode'       => $address_query->row['postcode'],
						'city'           => $address_query->row['city'],
						'zone_id'        => $address_query->row['zone_id'],
						'zone'           => $zone,
						'zone_code'      => $zone_code,
						'country_id'     => $address_query->row['country_id'],
						'country'        => $country,
						'iso_code_2'     => $iso_code_2,
						'iso_code_3'     => $iso_code_3,
						'address_format' => $address_format
				);
			}
		}
	
		public function getAddresses($customer_id) {
			$address_data = array();
	
			$query = $this->db->query("SELECT address_id FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");
	
			foreach ($query->rows as $result) {
				$address_info = $this->getAddress($result['address_id']);
	
				if ($address_info) {
					$address_data[$result['address_id']] = $address_info;
				}
			}
	
			return $address_data;
		}
	
		public function getTotalCustomers($data = array()) {
			$sql = "SELECT COUNT(*) AS total FROM lcl_cust";
	
			$implode = array();
	
			if (!empty($data['filter_name'])) {
				$implode[] = "CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
			}
	
			if (!empty($data['filter_email'])) {
				$implode[] = "email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
			}
	
			if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
				$implode[] = "newsletter = '" . (int)$data['filter_newsletter'] . "'";
			}
	
			if (!empty($data['filter_customer_group_id'])) {
				$implode[] = "customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
			}
	
			if (!empty($data['filter_ip'])) {
				$implode[] = "customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
			}
	
			if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
				$implode[] = "status = '" . (int)$data['filter_status'] . "'";
			}
	
			if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
				$implode[] = "approved = '" . (int)$data['filter_approved'] . "'";
			}
	
			if (!empty($data['filter_date_added'])) {
				$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
			}
	
			if ($implode) {
				$sql .= " WHERE " . implode(" AND ", $implode);
			}
	
			$query = $this->db->query($sql);
	
			return $query->row['total'];
		}
		
		public function getTotalActiveCustomers($data = array()) {
			$sql = "SELECT COUNT(*) AS total FROM lcl_cust";
		
			$implode = array();
		
			if (!empty($data['filter_date_added'])) {
				$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
			}
		
			if ($implode) {
				$sql .= " WHERE " . implode(" AND ", $implode);
			}
		
			$query = $this->db->query($sql);
		
			return $query->row['total'];
		}
	
		public function getTotalCustomersAwaitingApproval() {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE status = '0' OR approved = '0'");
	
			return $query->row['total'];
		}
	
		public function getTotalAddressesByCustomerId($customer_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");
	
			return $query->row['total'];
		}
	
		public function getTotalAddressesByCountryId($country_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE country_id = '" . (int)$country_id . "'");
	
			return $query->row['total'];
		}
	
		public function getTotalAddressesByZoneId($zone_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE zone_id = '" . (int)$zone_id . "'");
	
			return $query->row['total'];
		}
	
		public function getTotalCustomersByCustomerGroupId($customer_group_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE customer_group_id = '" . (int)$customer_group_id . "'");
	
			return $query->row['total'];
		}
		
		
		public function addHistory($customer_id, $comment) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_history SET customer_id = '" . (int)$customer_id . "', comment = '" . $this->db->escape(strip_tags($comment)) . "', date_added = NOW()");
		}
	
		public function getHistories($customer_id, $start = 0, $limit = 10) {
			if ($start < 0) {
				$start = 0;
			}
	
			if ($limit < 1) {
				$limit = 10;
			}
	
			$query = $this->db->query("SELECT comment, date_added FROM " . DB_PREFIX . "customer_history WHERE customer_id = '" . (int)$customer_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
	
			return $query->rows;
		}
	
		public function getTotalHistories($customer_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_history WHERE customer_id = '" . (int)$customer_id . "'");
	
			return $query->row['total'];
		}

		public function addTransaction_counter($customer_id){
			
			$query = $this->db->query("select custlcbks as bookcount from  lcl_cust where custcode = '" . $customer_id . "'");
			
				$count = $query->row['bookcount'];
				$this->session->data['custlcbks'] =$count+1;
				
			
				$this->db->query("insert into lcl_cust_temp (`CustName1`, `CustName2`, `CustStreet`, `CustCity`, `CustState`, `CustZip`, `CustEin`, `CustCode`,
						 `CustCont1`, `CustCont2`, `CustTel`, `CustIFax`, `CustEFax`, `CustProd`, `CustPeff`, `CustExpO`, `CustPSHp`, `CustNVO`, `CustIMP`, 
						`CustFF`, `CustFComp`, `CustCComp`, `CustSStat`, `CustTerms`, `CustIFCon`, `CustIMCon`, `Custnotes1`, `CustSBill`, `Custwhsrl`, 
						`CustSOrg`, `custlcom`, `custfcom`, `custicom`, `CustcType`, `CustCLAdj`, `CustCFact`, `CustUltD`, `CustLastR`, `CustLRDt`, `CustHM`,
						 `CustFMC`, `CustCHB`, `CustARAP`, `CustRept`, `CustNext`, `Custlemail`, `custunvco`, `custeddat`, `custfilly`, `custlcqts`,
						 `custlcbks`, `custlhqts`, `custlhbks`, `custlsdt`, `custfcqts`, `custfcbks`, `custfhqts`, `custfhbks`, `custfsdt`, `custactv`,
						 `custcaby`, `custfill`, `custfemail`, `custiemail`, `custcafax`, `custccfax`, `custnofax`, `custfillx`, `CustPers`, `CustPrev`, 
						`CustEnBy`, `CustEdBy`, `CustrCom3`, `CustrCom4`, `CustBook`, `CustCCA`, `CustRLcl`, `CustRFcl`, `CustRall`, `custstrt`, `custlimt`,
						 `Custlday`, `Custdelq`, `custddat`, `custRimp`, `CustFIss`, `Custweb`, `custaes`, `custdock`, `custqt`, `custlabl`, `custafee`,
						 `custmemo`, `custdomw`, `custforw`, `custsame`, `custdbrok`, `custscomm`, `custkey`, `custpoa`, `custbroadcast`, `custautook`,
						 `custnofclqt`, `custnolclqt`, `custnoimpqt`, `custedi1`, `custedi2`, `custedi3`, `custedi4`, `custproofnorate`, `custcontlist`,
						 `custlcllrat`, `custlcllunr`, `custlcllorg`, `custlclerat`, `custlcleunr`, `custlcleorg`, `custfcllrat`, `custfcllunr`, `custfcllorg`,
						 `custfclerat`, `custfcleunr`, `custfcleorg`, `custrelemail`, `custrelacct`,`custrelvia`, `custrelemadd`, `custagent`, `lclcremail`,
						 `fclcremail`, `custsdest`, `custsrate`, `custsreb`, `custragt`, `custrtier`, `custrcon`, `custfclrout`, `custsplitad`, `custolb`,
						 `custaddon`, `custaddaamt`, `custaddtyp`, `custnopreproof`, `custnational`, `custshowcft`, `custaesrate`, `custctfax`, `custcalog`,
						 `custcclog`, `custctlog`, `custpoalog`, `custctinfax`, `custctinlog`, `custcainfax`, `custcainlog`, `custccinfax`, `custccinlog`,
						 `custnorebate`, `custnochassis`, `custnofclnotice`, `custspecrate`, `custuserouted`, `custusualagent`, `custusualservice`, 
						`custususalpod`, `custusualother`, `custnorouting`, `custsrquotes`, `custsrbooks`, `custactgemail`	)
			
  		        select  `CustName1`, `CustName2`, `CustStreet`, `CustCity`, `CustState`, `CustZip`, `CustEin`, `CustCode`,
						 `CustCont1`, `CustCont2`, `CustTel`, `CustIFax`, `CustEFax`, `CustProd`, `CustPeff`, `CustExpO`, `CustPSHp`, `CustNVO`, `CustIMP`, 
						`CustFF`, `CustFComp`, `CustCComp`, `CustSStat`, `CustTerms`, `CustIFCon`, `CustIMCon`, `Custnotes1`, `CustSBill`, `Custwhsrl`, 
						`CustSOrg`, `custlcom`, `custfcom`, `custicom`, `CustcType`, `CustCLAdj`, `CustCFact`, `CustUltD`, `CustLastR`, `CustLRDt`, `CustHM`,
						 `CustFMC`, `CustCHB`, `CustARAP`, `CustRept`, `CustNext`, `Custlemail`, `custunvco`, `custeddat`, `custfilly`, `custlcqts`,
						 '".$this->session->data['custlcbks']."', `custlhqts`, `custlhbks`, `custlsdt`, `custfcqts`, `custfcbks`, `custfhqts`, `custfhbks`, `custfsdt`, `custactv`,
						 `custcaby`, `custfill`, `custfemail`, `custiemail`, `custcafax`, `custccfax`, `custnofax`, `custfillx`, `CustPers`, `CustPrev`, 
						`CustEnBy`, `CustEdBy`, `CustrCom3`, `CustrCom4`, `CustBook`, `CustCCA`, `CustRLcl`, `CustRFcl`, `CustRall`, `custstrt`, `custlimt`,
						 `Custlday`, 'A', `custddat`, `custRimp`, `CustFIss`, `Custweb`, `custaes`, `custdock`, `custqt`, `custlabl`, `custafee`,
						 `custmemo`, `custdomw`, `custforw`, `custsame`, `custdbrok`, `custscomm`, `custkey`, `custpoa`, `custbroadcast`, `custautook`,
						 `custnofclqt`, `custnolclqt`, `custnoimpqt`, `custedi1`, `custedi2`, `custedi3`, `custedi4`, `custproofnorate`, `custcontlist`,
						 `custlcllrat`, `custlcllunr`, `custlcllorg`, `custlclerat`, `custlcleunr`, `custlcleorg`, `custfcllrat`, `custfcllunr`, `custfcllorg`,
						 `custfclerat`, `custfcleunr`, `custfcleorg`, `custrelemail`, `custrelacct`,`custrelvia`, `custrelemadd`, `custagent`, `lclcremail`,
						 `fclcremail`, `custsdest`, `custsrate`, `custsreb`, `custragt`, `custrtier`, `custrcon`, `custfclrout`, `custsplitad`, `custolb`,
						 `custaddon`, `custaddaamt`, `custaddtyp`, `custnopreproof`, `custnational`, `custshowcft`, `custaesrate`, `custctfax`, `custcalog`,
						 `custcclog`, `custctlog`, `custpoalog`, `custctinfax`, `custctinlog`, `custcainfax`, `custcainlog`, `custccinfax`, `custccinlog`,
						 `custnorebate`, `custnochassis`, `custnofclnotice`, `custspecrate`, `custuserouted`, `custusualagent`, `custusualservice`, 
						`custususalpod`, `custusualother`, `custnorouting`, `custsrquotes`, `custsrbooks`, `custactgemail`
						
				from lcl_cust where custcode = '" . $customer_id ."' ");
			
			
			
		}
		
		public function addTransaction($customer_id, $description = '', $amount = '', $order_id = 0) {
			$customer_info = $this->getCustomer($customer_id);
	
			if ($customer_info) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "customer_transaction SET customer_id = '" . (int)$customer_id . "', order_id = '" . (int)$order_id . "', description = '" . $this->db->escape($description) . "', amount = '" . (float)$amount . "', date_added = NOW()");
	
				$this->language->load('mail/customer');
					
				if ($customer_info['store_id']) {
					$this->load->model('setting/store');
	
					$store_info = $this->model_setting_store->getStore($customer_info['store_id']);
	
					if ($store_info) {
						$store_name = $store_info['name'];
					} else {
						$store_name = $this->config->get('config_name');
					}
				} else {
					$store_name = $this->config->get('config_name');
				}
	
				$message  = sprintf($this->language->get('text_transaction_received'), $this->currency->format($amount, $this->config->get('config_currency'))) . "\n\n";
				$message .= sprintf($this->language->get('text_transaction_total'), $this->currency->format($this->getTransactionTotal($customer_id)));
	
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setTo($customer_info['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($store_name);
				$mail->setSubject(html_entity_decode(sprintf($this->language->get('text_transaction_subject'), $this->config->get('config_name')), ENT_QUOTES, 'UTF-8'));
				$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				$mail->send();
			}
		}
	
		public function deleteTransaction($order_id) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "customer_transaction WHERE order_id = '" . (int)$order_id . "'");
		}
	
		public function getTransactions($customer_id, $start = 0, $limit = 10) {
			
			
			if ($start < 0) {
				$start = 0;
			}
	
			if ($limit < 1) {
				$limit = 10;
			}
	
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
	
			return $query->rows;
		}
	
		public function getTotalTransactions($customer_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "'");
	
			return $query->row['total'];
		}
			
		public function getTransactionTotal($customer_id) {
			$query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "'");
	
			return $query->row['total'];
		}
	
		public function getTotalTransactionsByOrderId($order_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_transaction WHERE order_id = '" . (int)$order_id . "'");
	
			return $query->row['total'];
		}
	
		public function addReward($customer_id, $description = '', $points = '', $order_id = 0) {
			$customer_info = $this->getCustomer($customer_id);
				
			if ($customer_info) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET customer_id = '" . (int)$customer_id . "', order_id = '" . (int)$order_id . "', points = '" . (int)$points . "', description = '" . $this->db->escape($description) . "', date_added = NOW()");
	
				$this->language->load('mail/customer');
					
				if ($order_id) {
					$this->load->model('sale/order');
	
					$order_info = $this->model_sale_order->getOrder($order_id);
	
					if ($order_info) {
						$store_name = $order_info['store_name'];
					} else {
						$store_name = $this->config->get('config_name');
					}
				} else {
					$store_name = $this->config->get('config_name');
				}
	
				$message  = sprintf($this->language->get('text_reward_received'), $points) . "\n\n";
				$message .= sprintf($this->language->get('text_reward_total'), $this->getRewardTotal($customer_id));
	
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setTo($customer_info['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($store_name);
				$mail->setSubject(html_entity_decode(sprintf($this->language->get('text_reward_subject'), $store_name), ENT_QUOTES, 'UTF-8'));
				$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				$mail->send();
			}
		}
	
		public function deleteReward($order_id) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "customer_reward WHERE order_id = '" . (int)$order_id . "'");
		}
	
		public function getRewards($customer_id, $start = 0, $limit = 10) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
	
			return $query->rows;
		}
	
		public function getTotalRewards($customer_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");
	
			return $query->row['total'];
		}
			
		public function getRewardTotal($customer_id) {
			$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");
	
			return $query->row['total'];
		}
	
		public function getTotalCustomerRewardsByOrderId($order_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_reward WHERE order_id = '" . (int)$order_id . "'");
	
			return $query->row['total'];
		}
	
		public function getIpsByCustomerId($customer_id) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$customer_id . "'");
	
			return $query->rows;
		}
	
		public function getTotalCustomersByIp($ip) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($ip) . "'");
	
			return $query->row['total'];
		}
	
		public function addBanIp($ip) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "customer_ban_ip` SET `ip` = '" . $this->db->escape($ip) . "'");
		}
	
		public function removeBanIp($ip) {
			$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_ban_ip` WHERE `ip` = '" . $this->db->escape($ip) . "'");
		}
			
		public function getTotalBanIpsByIp($ip) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "customer_ban_ip` WHERE `ip` = '" . $this->db->escape($ip) . "'");
				
			return $query->row['total'];
		}
	}
	?>