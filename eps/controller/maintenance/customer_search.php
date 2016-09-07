<?php
class ControllerMaintenanceCustomersearch extends Controller {
	
	public function index() {
		$this->language->load('maintenance/customer_search');
		
		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('maintenance/customer');
	
		$this->getList();
	}
	

	
	protected function getList() {
		
		//Set filters or null
		
		if (isset($this->request->get['filter_custkey'])) {$filter_custkey = $this->request->get['filter_custkey'];} else {$filter_custkey = null;}
		if (isset($this->request->get['filter_custcode'])) {$filter_custcode = $this->request->get['filter_custcode'];} else {$filter_custcode = null;}
		if (isset($this->request->get['filter_custstreet'])) {$filter_custstreet = $this->request->get['filter_custstreet'];} else {$filter_custstreet = null;}
		if (isset($this->request->get['filter_custstate'])) {$filter_custstate = $this->request->get['filter_custstate'];} else {$filter_custstate = null;}
		if (isset($this->request->get['filter_custzip'])) {$filter_custzip = $this->request->get['filter_custzip'];} else {$filter_custzip = null;}
		if (isset($this->request->get['filter_custtel'])) {$filter_custtel = $this->request->get['filter_custtel'];} else {$filter_custtel = null;}
		if (isset($this->request->get['filter_custefax'])) {$filter_custefax = $this->request->get['filter_custefax'];} else {$filter_custefax = null;}
		if (isset($this->request->get['filter_custifax'])) {$filter_custifax = $this->request->get['filter_custifax'];} else {$filter_custifax = null;}
		
		if (isset($this->request->get['sort'])) {$sort = $this->request->get['sort'];} else {$sort = null;}
		if (isset($this->request->get['order'])) {$order = $this->request->get['order'];} else {$order = 'DESC';	}
		if (isset($this->request->get['page'])) {$page = $this->request->get['page'];} else {$page = 1;}
	
		
		//Set routes to filters
		$url = '';

		if (isset($this->request->get['filter_custkey'])) {$url .= '&filter_custkey=' . $this->request->get['filter_custkey'];}
		if (isset($this->request->get['filter_custcode'])) {$url .= '&filter_custcode=' . $this->request->get['filter_custcode'];}
		if (isset($this->request->get['filter_custstreet'])) {$url .= '&filter_custstreet=' . $this->request->get['filter_custstreet'];}
		if (isset($this->request->get['filter_custstate'])) {$url .= '&filter_custstate=' . $this->request->get['filter_custstate'];}
		if (isset($this->request->get['filter_custzip'])) {$url .= '&filter_custzip=' . $this->request->get['filter_custzip'];}
		if (isset($this->request->get['filter_custtel'])) {$url .= '&filter_custtel=' . $this->request->get['filter_custtel'];}
		if (isset($this->request->get['filter_custefax'])) {$url .= '&filter_custefax=' . $this->request->get['filter_custefax'];}
		if (isset($this->request->get['filter_custifax'])) {$url .= '&filter_custifax=' . $this->request->get['filter_custifax'];}
	
		if (isset($this->request->get['sort'])) {$url .= '&sort=' . $this->request->get['sort'];}
		if (isset($this->request->get['order'])) {$url .= '&order=' . $this->request->get['order'];}
		if (isset($this->request->get['page'])) {$url .= '&page=' . $this->request->get['page'];}
	
		$data['breadcrumbs'] = array();
	
		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home/sessioninfo', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
		);
	
		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
		);
	
		$data['customers'] = array();
	
		$data = array(
				'filter_custkey'           => $filter_custkey,
				'filter_custcode'          => $filter_custcode,
				'filter_custstreet'        => $filter_custstreet,
				'filter_custstate'         => $filter_custstate,
				'filter_custzip'           => $filter_custzip,
				'filter_custtel'           => $filter_custtel,
				'filter_custefax'          => $filter_custefax,
				'filter_custifax'          => $filter_custifax,
				'sort'                     => $sort,
				'order'                    => $order,
				'start'                    => ($page - 1) * $this->config->get('config_admin_limit'),
				'limit'                    => $this->config->get('config_admin_limit')
		);
	
		// Set size of Pagination
		$TotalAccounts= $this->model_maintenance_customer->getTotalAccounts($data);
		// Set customer data
		$results = $this->model_maintenance_customer->getCustomers($data);
	
	// Post back from search form	
		if (isset($this->request->post['customer_id'])){
			$_SESSION['booking_customer_no'] = ($this->request->post['customer_id']);		
		}
	// Update booking with customer information
		$data['customer_link'] = ($this->url->link('service/booking/updateCustomer', 'token=' . $this->session->data['token']. '&customer_id=' . $url, 'SSL'));
		
		
		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
					'text' => 'Select',
					'href' => $this->url->link('service/booking/updateCustomer', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['CustCode'] . $url, 'SSL')
			);
		
			$data['customers'][] = array(
					'custkey'     => $result['custkey'],
					'CustCode'     => $result['CustCode'],
					'CustStreet'   => $result['CustStreet'],
					'CustState'    => $result['CustState'],
					'CustZip'      => $result['CustZip'],
					'CustTel'      => $result['CustTel'],
					'CustEFax'     => $result['CustEFax'],
					'CustIFax'     => $result['CustIFax'],
					'selected'     => isset($this->request->post['selected']) && in_array($result['custcode'], $this->request->post['selected']),
					'action'       => $action
			);
		}
			
		$data['heading_title'] = $this->language->get('heading_title');
	
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
			
		$data['column_custkey'] = $this->language->get('column_custkey');
		$data['column_custcode'] = $this->language->get('column_custcode');
		$data['column_custstreet'] = $this->language->get('column_custstreet');
		$data['column_custstate'] = $this->language->get('column_custstate');
		$data['column_custzip'] = $this->language->get('column_custzip');
		$data['column_custtel'] = $this->language->get('column_custtel');
		$data['column_custefax'] = $this->language->get('column_custefax');
		$data['column_custifax'] = $this->language->get('column_custifax');
		
		
		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
	
		$data['token'] = $this->session->data['token'];
	
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
	
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
	
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
	
		$url = '';
	
		if (isset($this->request->get['filter_custkey'])) {$url .= '&filter_custkey=' . urlencode(html_entity_decode($this->request->get['filter_custkey'], ENT_QUOTES, 'UTF-8'));}
		if (isset($this->request->get['filter_custstreet'])) {$url .= '&filter_custstreet=' . $this->request->get['filter_custstreet'];}
		if (isset($this->request->get['filter_custcode'])) {$url .= '&filter_custcode=' . $this->request->get['filter_custcode'];}
		if (isset($this->request->get['filter_custstate'])) {$url .= '&filter_custstate=' .$this->request->get['filter_custstate'];}
		if (isset($this->request->get['filter_custzip'])) {$url .= '&filter_custzip=' . $this->request->get['filter_custzip'];}
		if (isset($this->request->get['filter_custtel'])) {$url .= '&filter_custtel=' . $this->request->get['filter_custtel'];}
		if (isset($this->request->get['filter_custefax'])) {$url .= '&filter_custefax=' . $this->request->get['filter_custefax'];}
		if (isset($this->request->get['filter_custifax'])) {$url .= '&filter_custifax=' . $this->request->get['filter_custifax'];}
		
		
		if ($order == 'ASC') {$url .= '&order=DESC';} else {$url .= '&order=ASC';}
		if (isset($this->request->get['page'])) {$url .= '&page=' . $this->request->get['page'];}
	
		$data['sort_custkey'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custkey' . $url, 'SSL');
		$data['sort_custcode'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=CustCode' . $url, 'SSL');
		$data['sort_custstreet'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custstreet' . $url, 'SSL');
		$data['sort_custstate'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custstate' . $url, 'SSL');
		$data['sort_custzip'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custzip' . $url, 'SSL');
		$data['sort_custtel'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custtel' . $url, 'SSL');
		$data['sort_custefax'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custefax' . $url, 'SSL');
		$data['sort_custifax'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custifax' . $url, 'SSL');
		
		
		$url = '';
	
		if (isset($this->request->get['filter_custkey'])) {$url .= '&filter_custkey=' . urlencode(html_entity_decode($this->request->get['filter_custkey'], ENT_QUOTES, 'UTF-8'));}
		if (isset($this->request->get['filter_custstreet'])) {$url .= '&filter_custstreet=' .$this->request->get['filter_custstreet'];}
		if (isset($this->request->get['filter_custcode'])) {$url .= '&filter_custcode=' . $this->request->get['filter_custcode'];}
		if (isset($this->request->get['filter_custstate'])) {$url .= '&filter_custstate=' .$this->request->get['filter_custstate'];}
		if (isset($this->request->get['filter_custzip'])) {$url .= '&filter_custzip=' . $this->request->get['filter_custzip'];}
		if (isset($this->request->get['filter_custtel'])) {$url .= '&filter_custtel=' . $this->request->get['filter_custtel'];}
		if (isset($this->request->get['filter_custefax'])) {$url .= '&filter_custefax=' . $this->request->get['filter_custefax'];}
		if (isset($this->request->get['filter_custifax'])) {$url .= '&filter_custifax=' . $this->request->get['filter_custifax'];}
		
		if (isset($this->request->get['sort'])) {$url .= '&sort=' . $this->request->get['sort'];}
		if (isset($this->request->get['order'])) {$url .= '&order=' . $this->request->get['order'];}
	
		$pagination = new Pagination();
		$pagination->total = $TotalAccounts;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$data['pagination'] = $pagination->render();
	
		$data['filter_custkey'] =  $filter_custkey;
		$data['filter_custcode'] =  $filter_custcode;
		$data['filter_custstreet'] =  $filter_custstreet;
		$data['filter_custstate'] =  $filter_custstate;
		$data['filter_custzip'] =  $filter_custzip;
		$data['filter_custtel'] =  $filter_custtel;
		$data['filter_custefax'] =  $filter_custefax;
		$data['filter_custifax'] =  $filter_custifax;
		
		
		$this->load->model('setting/store');
	
		$data['stores'] = $this->model_setting_store->getStores();
	
		$data['sort'] = $sort;
		$data['order'] = $order;
	
		$this->template = 'maintenance/customer_list.tpl';
		$this->children = array(
				'common/header',
				'common/footer'
		);
	
		$this->response->setOutput($this->render());
	}
	
	public function autocomplete() {
		$json = array();
	
		if (isset($this->request->get['filter_custkey'])) {
			$this->load->model('maintenance/customer');
	
			$data = array(
					'filter_name' => $this->request->get['filter_custkey'],
					'start'       => 0,
					'limit'       => 20
			);
	
			$results = $this->model_maintenance_customer->getCustomers($data);
	
			foreach ($results as $result) {
				$json[] = array(
						'customer'     => $result['custkey'],
						'custcode'     => $result['CustCode'],
						'CustStreet'   => $result['CustStreet'],
						'CustState'    => $result['CustState'],
						'CustZip'      => $result['CustZip'],
						'CustTel'      => $result['CustTel'],
						'CustEFax'     => $result['CustEFax'],
						'CustIFax'     => $result['CustIFax'],
				);
			}
		}
	
		$sort_order = array();
			
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['custkey'];
		}
	
		array_multisort($sort_order, SORT_ASC, $json);
	
		$this->response->setOutput(json_encode($json));
	}
	
	public function getBookingCustomer(){
		$json = array();
		
		if (isset($this->request->get['filter_custkey'])) {
			$this->load->model('maintenance/customer');
		
			$data = array(
				'filter_custkey' 		   => $this->request->get['filter_custkey'],
				'start'       			   => 0,
				'limit'       			   => 20
			);
			
		
		$results = $this->model_maintenance_customer->getCustomers($data);
		
			foreach ($results as $result) {
				$json[] = array(
					'custkey'  		 => strip_tags(html_entity_decode($result['custkey'], ENT_QUOTES, 'UTF-8')),
					'CustCode'       => strip_tags(html_entity_decode($result['CustCode'], ENT_QUOTES, 'UTF-8')),
					'CustName1'		=> strip_tags(html_entity_decode($result['CustName1'], ENT_QUOTES, 'UTF-8')),
					'CustName2'		=> strip_tags(html_entity_decode($result['CustName2'], ENT_QUOTES, 'UTF-8')),
					'CustStreet'       => strip_tags(html_entity_decode($result['CustStreet'], ENT_QUOTES, 'UTF-8')),
					'CustCity'       => strip_tags(html_entity_decode($result['CustCity'], ENT_QUOTES, 'UTF-8')),
					'CustState'       => strip_tags(html_entity_decode($result['CustState'], ENT_QUOTES, 'UTF-8')),
					'CustZip'       => strip_tags(html_entity_decode($result['CustZip'], ENT_QUOTES, 'UTF-8')),
					'CustLastR'       => strip_tags(html_entity_decode($result['CustLastR'], ENT_QUOTES, 'UTF-8')),
					'custuserouted'   => strip_tags(html_entity_decode($result['custuserouted'], ENT_QUOTES, 'UTF-8')),
					'custtelephone'   => strip_tags(html_entity_decode($result['CustTel'], ENT_QUOTES, 'UTF-8')),
					'custff'	=> strip_tags(html_entity_decode($result['CustFF'], ENT_QUOTES, 'UTF-8')),
						
				);
			}
		}
		
		
		$this->response->setOutput(json_encode($json));
		
	
	}
}
?>	