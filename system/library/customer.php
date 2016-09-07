<?php
class Customer {
	private $customer_id;
	private $firstname;
	private $lastname;
	private $email;
	private $telephone;
	private $fax;
	private $newsletter;
	private $customer_group_id;
	private $address_id;

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');

		if (isset($this->session->data['customer_id'])) {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND status = '1'");

			if ($customer_query->num_rows) {
				$this->customer_id = $customer_query->row['customer_id'];
				$this->firstname = $customer_query->row['firstname'];
				$this->lastname = $customer_query->row['lastname'];
				$this->email = $customer_query->row['email'];
				$this->telephone = $customer_query->row['telephone'];
				$this->fax = $customer_query->row['fax'];
				$this->newsletter = $customer_query->row['newsletter'];
				$this->customer_group_id = $customer_query->row['customer_group_id'];
				$this->address_id = $customer_query->row['address_id'];

				$this->db->query("UPDATE " . DB_PREFIX . "customer SET cart = '" . $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '') . "', wishlist = '" . $this->db->escape(isset($this->session->data['wishlist']) ? serialize($this->session->data['wishlist']) : '') . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

				if (!$query->num_rows) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "customer_ip SET customer_id = '" . (int)$this->session->data['customer_id'] . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', date_added = NOW()");
				}
			} else {
				$this->logout();
			}
		}
		
		
	}
	
	public function createObject(){
		
		if (isset($this->session->data['customer_object'])){	unset($this->session->data['customer_object']);	}
		
		$customer = new stdClass;
		$customer->timestamp=date('Y-d-m h:i:s');
	
		if (isset($this->session->data['customer']) && !empty($this->session->data['customer'])){$customer->customer=$this->session->data['customer'];};
		if (isset($this->session->data['customerdetail']) && !empty($this->session->data['customerdetail'])){$customer->customerdetail=$this->session->data['customerdetail'];};
		if (isset($this->session->data['customerName']) && !empty($this->session->data['customerName'])){$customer->customerName=$this->session->data['customerName'];};
		if (isset($this->session->data['customerAddress1']) && !empty($this->session->data['customerAddress1'])){$customer->customerAddress1=$this->session->data['customerAddress1'];};
		if (isset($this->session->data['customerAddress2']) && !empty($this->session->data['customerAddress2'])){$customer->customerAddress2=$this->session->data['customerAddress2'];};
		if (isset($this->session->data['customerCity']) && !empty($this->session->data['customerCity'])){$customer->customerCity=$this->session->data['customerCity'];};
		if (isset($this->session->data['customerState']) && !empty($this->session->data['customerState'])){$customer->customerState=$this->session->data['customerState'];};
		if (isset($this->session->data['customerZip']) && !empty($this->session->data['customerZip'])){$customer->customerZip=$this->session->data['customerZip'];};
		if (isset($this->session->data['customerSignator']) && !empty($this->session->data['customerSignator'])){$customer->customerSignator=$this->session->data['customerSignator'];};
		if (isset($this->session->data['customerConsignee']) && !empty($this->session->data['customerConsignee'])){$customer->customerConsignee=$this->session->data['customerConsignee'];};
		if (isset($this->session->data['customerNotify']) && !empty($this->session->data['customerNotify'])){$customer->customerNotify=$this->session->data['customerNotify'];};
		if (isset($this->session->data['customercontact']) && !empty($this->session->data['customercontact'])){$customer->customercontact=$this->session->data['customercontact'];};
		if (isset($this->session->data['custtelephone']) && !empty($this->session->data['custtelephone'])){$customer->custtelephone=$this->session->data['custtelephone'];};
		if (isset($this->session->data['custfax']) && !empty($this->session->data['custfax'])){$customer->custfax=$this->session->data['custfax'];} else{$this->session->data['custfax']='';};
		if (isset($this->session->data['cpytosalesrep']) && !empty($this->session->data['cpytosalesrep'])){$customer->cpytosalesrep=$this->session->data['cpytosalesrep'];};
		if (isset($this->session->data['custemail']) && !empty($this->session->data['custemail'])){$customer->custemail=$this->session->data['custemail'];};
		if (isset($this->session->data['agentemail']) && !empty($this->session->data['agentemail'])){$customer->agentemail=$this->session->data['agentemail'];};
		if (isset($this->session->data['CustLastR']) && !empty($this->session->data['CustLastR'])){$customer->CustLastR=$this->session->data['CustLastR'];};
		if (isset($this->session->data['custuserouted']) && !empty($this->session->data['custuserouted'])){$customer->custuserouted=$this->session->data['custuserouted'];};
		if (isset($this->session->data['CustFF']) && !empty($this->session->data['CustFF'])){$customer->CustFF=$this->session->data['CustFF'];};
		
		$this->session->data['customer_object'] = $customer;
	}
	
	public function login($email, $password, $override = false) {
		if ($override) {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND status = '1'");
		} else {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1' AND approved = '1'");
		}

		if ($customer_query->num_rows) {
			$this->session->data['customer_id'] = $customer_query->row['customer_id'];

			if ($customer_query->row['cart'] && is_string($customer_query->row['cart'])) {
				$cart = unserialize($customer_query->row['cart']);

				foreach ($cart as $key => $value) {
					if (!array_key_exists($key, $this->session->data['cart'])) {
						$this->session->data['cart'][$key] = $value;
					} else {
						$this->session->data['cart'][$key] += $value;
					}
				}
			}

			if ($customer_query->row['wishlist'] && is_string($customer_query->row['wishlist'])) {
				if (!isset($this->session->data['wishlist'])) {
					$this->session->data['wishlist'] = array();
				}

				$wishlist = unserialize($customer_query->row['wishlist']);

				foreach ($wishlist as $product_id) {
					if (!in_array($product_id, $this->session->data['wishlist'])) {
						$this->session->data['wishlist'][] = $product_id;
					}
				}
			}

			$this->customer_id = $customer_query->row['customer_id'];
			$this->firstname = $customer_query->row['firstname'];
			$this->lastname = $customer_query->row['lastname'];
			$this->email = $customer_query->row['email'];
			$this->telephone = $customer_query->row['telephone'];
			$this->fax = $customer_query->row['fax'];
			$this->newsletter = $customer_query->row['newsletter'];
			$this->customer_group_id = $customer_query->row['customer_group_id'];
			$this->address_id = $customer_query->row['address_id'];

			$this->db->query("UPDATE " . DB_PREFIX . "customer SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

			return true;
		} else {
			return false;
		}
	}

	public function logout() {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET cart = '" . $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '') . "', wishlist = '" . $this->db->escape(isset($this->session->data['wishlist']) ? serialize($this->session->data['wishlist']) : '') . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

		unset($this->session->data['customer_id']);

		$this->customer_id = '';
		$this->firstname = '';
		$this->lastname = '';
		$this->email = '';
		$this->telephone = '';
		$this->fax = '';
		$this->newsletter = '';
		$this->customer_group_id = '';
		$this->address_id = '';
	}

	public function isLogged() {
		return $this->customer_id;
	}

	public function getId() {
		return $this->customer_id;
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

	public function getTelephone() {
		return $this->telephone;
	}

	public function getFax() {
		return $this->fax;
	}

	public function getNewsletter() {
		return $this->newsletter;
	}

	public function getGroupId() {
		return $this->customer_group_id;
	}

	public function getAddressId() {
		return $this->address_id;
	}

	public function getBalance() {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$this->customer_id . "'");

		return $query->row['total'];
	}

	public function getRewardPoints() {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$this->customer_id . "'");

		return $query->row['total'];
	}
}