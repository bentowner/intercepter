<?php  

/**
 * @author Ben Towner
 * @name Customer - controller - Maintenance
 * @version 0.1
 * @package lclapp - Web application
 * @link http://www.TroyContainerLine.com
 */
class ControllerMaintenanceCustomer extends Controller {
		
	private $error = array();
	
	public function index() {
		$this->language->load('maintenance/customer');
		
		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('sale/customer');
		$this->load->model('maintenance/customer');
		$this->getList();
		
	}

	public function createObject(){
		$customer = new stdClass;
		$customer->timestamp=date('Y-d-m h:i:s');
	
		if (isset($this->session->data['customer'])&& !empty($this->session->data['customer'])){$customer->customer=$this->session->data['customer'];};
		if (isset($this->session->data['customerdetail'])&& !empty($this->session->data['customerdetail'])){$customer->customerdetail=$this->session->data['customerdetail'];};
		if (isset($this->session->data['customerName'])&& !empty($this->session->data['customerName'])){$customer->customerName=$this->session->data['customerName'];};
		if (isset($this->session->data['customerAddress1'])&& !empty($this->session->data['customerAddress1'])){$customer->customerAddress1=$this->session->data['customerAddress1'];};
		if (isset($this->session->data['customerAddress2'])&& !empty($this->session->data['customerAddress2'])){$customer->customerAddress2=$this->session->data['customerAddress2'];};
		if (isset($this->session->data['customerCity'])&& !empty($this->session->data['customerCity'])){$customer->customerCity=$this->session->data['customerCity'];};
		if (isset($this->session->data['customerState'])&& !empty($this->session->data['customerState'])){$customer->customerState=$this->session->data['customerState'];};
		if (isset($this->session->data['customerZip'])&& !empty($this->session->data['customerZip'])){$customer->customerZip=$this->session->data['customerZip'];};
		if (isset($this->session->data['customerSignator'])&& !empty($this->session->data['customerSignator'])){$customer->customerSignator=$this->session->data['customerSignator'];};
		if (isset($this->session->data['customerConsignee'])&& !empty($this->session->data['customerConsignee'])){$customer->customerConsignee=$this->session->data['customerConsignee'];};
		if (isset($this->session->data['customerNotify'])&& !empty($this->session->data['customerNotify'])){$customer->customerNotify=$this->session->data['customerNotify'];};
		if (isset($this->session->data['customercontact'])&& !empty($this->session->data['customercontact'])){$customer->customercontact=$this->session->data['customercontact'];};
		if (isset($this->session->data['custtelephone'])&& !empty($this->session->data['custtelephone'])){$customer->custtelephone=$this->session->data['custtelephone'];};
		if (isset($this->session->data['custfax'])&& !empty($this->session->data['custfax'])){$customer->custfax=$this->session->data['custfax'];} else{$this->session->data['custfax']='';};
		if (isset($this->session->data['cpytosalesrep'])&& !empty($this->session->data['cpytosalesrep'])){$customer->cpytosalesrep=$this->session->data['cpytosalesrep'];};
		if (isset($this->session->data['custemail'])&& !empty($this->session->data['custemail'])){$customer->custemail=$this->session->data['custemail'];};
		if (isset($this->session->data['agentemail'])&& !empty($this->session->data['agentemail'])){$customer->agentemail=$this->session->data['agentemail'];};
		
		return $customer;
	}
	
	public function insert() {
		$this->language->load('maintenance/customer');
	
		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('sale/customer');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_sale_customer->addCustomer($this->request->post);
				
			$this->session->data['success'] = $this->language->get('text_success');
	
			$url = '';
	
			if (isset($this->request->get['filter_name'])) { $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));}
			if (isset($this->request->get['filter_email'])) {$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));}
			if (isset($this->request->get['filter_customer_group_id'])) {$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];}	
			if (isset($this->request->get['filter_status'])) {$url .= '&filter_status=' . $this->request->get['filter_status'];		}				
			if (isset($this->request->get['filter_approved'])) {$url .= '&filter_approved=' . $this->request->get['filter_approved'];}	
			if (isset($this->request->get['filter_ip'])) {$url .= '&filter_ip=' . $this->request->get['filter_ip'];			}				
			if (isset($this->request->get['filter_date_added'])) {$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];	}				
			if (isset($this->request->get['sort'])) {$url .= '&sort=' . $this->request->get['sort'];}
			if (isset($this->request->get['order'])) {$url .= '&order=' . $this->request->get['order'];	}
			if (isset($this->request->get['page'])) {$url .= '&page=' . $this->request->get['page'];	}
				
			$this->response->redirect($this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		 
		$this->getForm();
	}
	 
	public function update() {
		$this->language->load('maintenance/customer');
	
		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('maintenance/customer');
		
		$url = '';
		$data['cancel'] = $this->url->link('maintenance/customer/clear', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->session->data['customer_test']= $results = $this->model_maintenance_customer->getCustomer($this->request->get['customer_id']);
//General		
		$this->session->data['customer_code']= $data['customer_code'] = $results['CustCode'];	
		$this->session->data['customer_status']= $data['customer_status'] = $results['Custdelq'];
		$this->session->data['customer_same']= $data['customer_same'] = $results['custsame'];
		$this->session->data['customer_national']= $data['customer_national'] = $results['custnational'];
	
		$this->session->data['customer_name']= $data['customer_name'] = $results['CustName1'];
		$this->session->data['customer_name2']= $data['customer_name2'] = $results['CustName2'];
		$this->session->data['customer_street']= $data['customer_street'] = $results['CustStreet'];
		$this->session->data['customer_city']= $data['customer_city'] = $results['CustCity'];
		$this->session->data['customer_state']= $data['customer_state'] = $results['CustState'];
		$this->session->data['customer_zip']= $data['customer_zip'] = $results['CustZip'];
		$this->session->data['customer_tel']= $data['customer_tel'] = $results['CustTel'];
			
		$this->session->data['customer_rep_lcl']= $data['customer_rep_lcl'] = $results['CustRLcl'];
		$this->session->data['customer_acct_lcl']= $data['customer_acct_lcl'] = $results['custlcom'];
		$this->session->data['customer_rep_fcl']= $data['customer_rep_fcl'] = $results['CustRFcl'];
		$this->session->data['customer_acct_lcl']= $data['customer_acct_lcl'] = $results['custfcom'];
		$this->session->data['customer_rep_imp']= $data['customer_rep_imp'] = $results['custRimp'];
		$this->session->data['customer_acct_imp']= $data['customer_acct_imp'] = $results['custicom'];
		//$this->session->data['customer_copy_quotes']= $data['customer_copy_quotes'] = $results['custsrquotes'];
		//$this->session->data['customer_copy_booking']= $data['customer_copy_booking'] = $results['custsrbooks'];
	// Miscellaneous Info
		$this->session->data['customer_terms']= $data['customer_terms'] = $results['CustTerms'];
		$this->session->data['customer_inland_control']= $data['customer_inland_control'] = $results['custfcom'];
		$this->session->data['customer_billing']= $data['customer_billing'] = $results['CustSBill'];
		$this->session->data['customer_intl_control']= $data['customer_intl_control'] = $results['custicom'];
		$this->session->data['customer_sales']= $data['customer_sales'] = $results['CustSStat'];
		$this->session->data['customer_usual_comm']= $data['customer_usual_comm'] = $results['CustProd'];
	// Customer Type
		$this->session->data['customer_nvo']= $data['customer_nvo'] = $results['CustNVO'];
		$this->session->data['customer_ff']= $data['customer_ff'] = $results['CustFF'];
		$this->session->data['customer_shipper']= $data['customer_shipper'] = $results['CustPSHp'];
		$this->session->data['customer_personal']= $data['customer_personal'] = $results['CustPeff'];
		$this->session->data['customer_import']= $data['customer_import'] = $results['CustIMP'];
		$this->session->data['customer_cca']= $data['customer_cca'] = $results['CustCCA'];
		$this->session->data['customer_fmc']= $data['customer_fmc'] = $results['CustFMC'];
		$this->session->data['customer_chb']= $data['customer_chb'] = $results['CustCHB'];
	// email info
		$this->session->data['customer_l_email']= $data['customer_l_email'] = $results['Custlemail'];
		$this->session->data['customer_f_email']= $data['customer_f_email'] = $results['custfemail'];
		$this->session->data['customer_i_email']= $data['customer_i_email'] = $results['custiemail'];
//Options	
		
		
		$this->getForm();
	}
	
	public function delete() {
		$this->language->load('maintenance/customer');
	
		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('sale/customer');
			
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $customer_id) {
				$this->model_sale_customer->deleteCustomer($customer_id);
			}
				
			$this->session->data['success'] = $this->language->get('text_success');
	
			$url = '';
	
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
				
			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}
				
			if (isset($this->request->get['filter_customer_group_id'])) {
				$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
			}
				
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
				
			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}
	
			if (isset($this->request->get['filter_ip'])) {
				$url .= '&filter_ip=' . $this->request->get['filter_ip'];
			}
				
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
				
			$this->response->redirect($this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
	
		$this->getList();
	}
	
	public function approve() {
		$this->language->load('maintenance/customer');

		$this->language->load('maintenance/customer');
		
		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('sale/customer');
	
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		} elseif (isset($this->request->post['selected'])) {
			$approved = 0;
				
			foreach ($this->request->post['selected'] as $customer_id) {
				$customer_info = $this->model_sale_customer->getCustomer($customer_id);
	
				if ($customer_info && !$customer_info['approved']) {
					$this->model_sale_customer->approve($customer_id);
						
					$approved++;
				}
			}
				
			$this->session->data['success'] = sprintf($this->language->get('text_approved'), $approved);
				
			$url = '';
	
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
	
			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}
				
			if (isset($this->request->get['filter_customer_group_id'])) {
				$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
			}
	
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
				
			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}
	
			if (isset($this->request->get['filter_ip'])) {
				$url .= '&filter_ip=' . $this->request->get['filter_ip'];
			}
	
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
	
			$this->response->redirect($this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
	
		$this->getList();
	}
	
	protected function getList() {
		
		if (isset($this->request->get['Use'])) {$Use = $this->request->get['Use'];} else {$Use = null;}
		
		if (isset($this->request->get['filter_name'])) {$filter_name = $this->request->get['filter_name'];} else {$filter_name = null;}
		if (isset($this->request->get['filter_email'])) {$filter_email = $this->request->get['filter_email'];} else {$filter_email = null;}
		if (isset($this->request->get['filter_customer'])) {$filter_customer = $this->request->get['filter_customer'];} else {$filter_customer = null;		}
		if (isset($this->request->get['filter_customer_code'])) {$filter_customer_code = $this->request->get['filter_customer_code'];} else {$filter_customer_code = null;		}
		if (isset($this->request->get['filter_customer_group_id'])) {$filter_customer_group_id = $this->request->get['filter_customer_group_id'];} else {$filter_customer_group_id = null;}
		if (isset($this->request->get['filter_status'])) {$filter_status = $this->request->get['filter_status'];} else {$filter_status = null;}
		if (isset($this->request->get['filter_approved'])) {$filter_approved = $this->request->get['filter_approved'];} else {$filter_approved = null;}
		if (isset($this->request->get['filter_ip'])) {$filter_ip = $this->request->get['filter_ip'];} else {$filter_ip = null;}
		if (isset($this->request->get['filter_date_added'])) {$filter_date_added = $this->request->get['filter_date_added'];} else {$filter_date_added = null;}
		
		if (isset($this->request->get['filter_custkey'])) {$filter_custkey = $this->request->get['filter_custkey'];} else {$filter_custkey = null;}
		if (isset($this->request->get['filter_custcode'])) {$filter_custcode = $this->request->get['filter_custcode'];} else {$filter_custcode = null;}
		if (isset($this->request->get['filter_custstreet'])) {$filter_custstreet = $this->request->get['filter_custstreet'];} else {$filter_custstreet = null;}
		if (isset($this->request->get['filter_custstate'])) {$filter_custstate = $this->request->get['filter_custstate'];} else {$filter_custstate = null;}
		if (isset($this->request->get['filter_custzip'])) {$filter_custzip = $this->request->get['filter_custzip'];} else {$filter_custzip = null;}
		if (isset($this->request->get['filter_custtel'])) {$filter_custtel = $this->request->get['filter_custtel'];} else {$filter_custtel = null;}
		if (isset($this->request->get['filter_custefax'])) {$filter_custefax = $this->request->get['filter_custefax'];} else {$filter_custefax = null;}
		if (isset($this->request->get['filter_custifax'])) {$filter_custifax = $this->request->get['filter_custifax'];} else {$filter_custifax = null;}
		if (isset($this->request->get['filter_salesrep'])) {$filter_salesrep = $this->request->get['filter_salesrep'];} else {$filter_salesrep = null;}
		
		if (isset($this->request->get['sort'])) {$sort = $this->request->get['sort'];} else {$sort = 'name';}
		if (isset($this->request->get['order'])) {$order = $this->request->get['order'];} else {$order = 'ASC';}
		if (isset($this->request->get['page'])) {$page = $this->request->get['page'];} else {$page = 1;}
		
		$url = '';
		
		if (isset($this->request->get['Use'])) {$url .= '&Use=' . $this->request->get['Use'];}
		if (isset($this->request->get['filter_customer'])) {$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));	}
		if (isset($this->request->get['filter_customer_code'])) {$url .= '&filter_customer_code=' . $this->request->get['filter_customer_code'];	}
		
		if (isset($this->request->get['filter_name'])) {$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));}
		if (isset($this->request->get['filter_email'])) {$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));}
		if (isset($this->request->get['filter_customer_group_id'])) {$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];}
		if (isset($this->request->get['filter_status'])) {$url .= '&filter_status=' . $this->request->get['filter_status'];}
		if (isset($this->request->get['filter_approved'])) {$url .= '&filter_approved=' . $this->request->get['filter_approved'];}
		if (isset($this->request->get['filter_ip'])) {$url .= '&filter_ip=' . $this->request->get['filter_ip'];}
		if (isset($this->request->get['filter_date_added'])) {$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];}
		
		if (isset($this->request->get['filter_custkey'])) {$url .= '&filter_custkey=' . $this->request->get['filter_custkey'];}
		if (isset($this->request->get['filter_custcode'])) {$url .= '&filter_custcode=' . $this->request->get['filter_custcode'];}
		if (isset($this->request->get['filter_custstreet'])) {$url .= '&filter_custstreet=' . $this->request->get['filter_custstreet'];}
		if (isset($this->request->get['filter_custstate'])) {$url .= '&filter_custstate=' . $this->request->get['filter_custstate'];}
		if (isset($this->request->get['filter_custzip'])) {$url .= '&filter_custzip=' . $this->request->get['filter_custzip'];}
		if (isset($this->request->get['filter_custtel'])) {$url .= '&filter_custtel=' . $this->request->get['filter_custtel'];}
		if (isset($this->request->get['filter_custefax'])) {$url .= '&filter_custefax=' . $this->request->get['filter_custefax'];}
		if (isset($this->request->get['filter_custifax'])) {$url .= '&filter_custifax=' . $this->request->get['filter_custifax'];}
		if (isset($this->request->get['filter_salesrep'])) {$url .= '&filter_salesrep=' . $this->request->get['filter_salesrep'];}
		
		if (isset($this->request->get['sort'])) {$url .= '&sort=' . $this->request->get['sort'];}
		if (isset($this->request->get['order'])) {$url .= '&order=' . $this->request->get['order'];}
		if (isset($this->request->get['page'])) {$url .= '&page=' . $this->request->get['page'];}
	
		$data['breadcrumbs'] = array();
	
		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
		);
	
		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('maintenance/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
		);
	
		$data['approve'] = $this->url->link('maintenance/customer/approve', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['insert'] = $this->url->link('maintenance/customer/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('maintenance/customer/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
	
		if (isset($this->request->get['customer_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$customer_info = $this->model_maintenance_customer->getCustomer($this->request->get['customer_id']);
		}
			
		if (isset($this->request->post['firstname'])) {	$data['firstname'] = $this->request->post['firstname'];} elseif (!empty($customer_info)) {	$data['firstname'] = $customer_info['firstname'];} else {$data['firstname'] = '';	}
		if (isset($this->request->post['lastname'])) {$data['lastname'] = $this->request->post['lastname'];} elseif (!empty($customer_info)) {$data['lastname'] = $customer_info['lastname'];} else {$data['lastname'] = '';}
		if (isset($this->request->post['email'])) {$data['email'] = $this->request->post['email'];} elseif (!empty($customer_info)) {	$data['email'] = $customer_info['email'];} else {$data['email'] = '';}
		if (isset($this->request->post['telephone'])) {$data['telephone'] = $this->request->post['telephone'];} elseif (!empty($customer_info)) {	$data['telephone'] = $customer_info['telephone'];	} else {$data['telephone'] = '';}
		if (isset($this->request->post['fax'])) {$data['fax'] = $this->request->post['fax'];} elseif (!empty($customer_info)) {$data['fax'] = $customer_info['fax'];	} else {$data['fax'] = '';}
		if (isset($this->request->post['newsletter'])) {$data['newsletter'] = $this->request->post['newsletter'];	} elseif (!empty($customer_info)) {	$data['newsletter'] = $customer_info['newsletter'];} else {$data['newsletter'] = '';	}
		
		$data['customers'] = array();
	
		$customer_data = array(
				'filter_name'              => $filter_name,
				'filter_email'             => $filter_email,
				'filter_customer_group_id' => $filter_customer_group_id,
				'filter_status'            => $filter_status,
				'filter_approved'          => $filter_approved,
				'filter_date_added'        => $filter_date_added,
				'filter_ip'                => $filter_ip,
				
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

		$this->load->model('service/customer');
		
		$customer_total = $this->model_service_customer->getTotalCustomers($customer_data);
	
		$results = $this->model_service_customer->getCustomers($customer_data);
		//$customer_total = sizeof(is_array($results));
		
		foreach ($results as $result) {
				$action = array();
	
			if (isset($this->request->get['Use'])) {
				if ($this->request->get['Use']=='Booking'){
					$action[] = array(
							'text' => $this->language->get('text_edit'),
							'href' => $this->url->link('service/booking/insert', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['CustCode'].'&Use=Booking' . $url, 'SSL')
					);
				}
				if ($this->request->get['Use']=='Quote'){
					$action[] = array(
							'text' => $this->language->get('text_edit'),
							'href' => $this->url->link('service/quotations/insert', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['CustCode'].'&Use=Quote' . $url, 'SSL')
					);
				}
			}else {
				
			$action[] = array(
					'text' => $this->language->get('text_edit'),
					'href' => $this->url->link('maintenance/customer/update', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['CustCode'] . $url, 'SSL')
			);
			}
			
			$data['customers'][] = array(
					'custkey'     => $result['custkey'],
					'CustCode'     => $result['CustCode'],
					'CustStreet'   => $result['CustStreet'],
					'CustState'    => $result['CustState'],
					'CustZip'      => $result['CustZip'],
					'CustTel'      => $result['CustTel'],
					'CustEFax'     => $result['CustEFax'],
					'CustIFax'     => $result['CustIFax'],

					'status'     => $result['CustSStat'],
					'selected'     => isset($this->request->post['selected']) && in_array($result['custcode'], $this->request->post['selected']),
					'action'       => $action
			);
		}
		
		
			
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['entry_customer'] = $this->language->get('entry_customer');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
	
		$data['Use'] = $Use;
		$data['filter_customer'] = $filter_customer;
		$data['filter_customer_code'] = $filter_customer_code;
		
		
		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_login'] = $this->language->get('column_login');
		$data['column_action'] = $this->language->get('column_action');
		
		$data['column_custkey'] = $this->language->get('column_custkey');
		$data['column_custcode'] = $this->language->get('column_custcode');
		$data['column_custstreet'] = $this->language->get('column_custstreet');
		$data['column_custstate'] = $this->language->get('column_custstate');
		$data['column_custzip'] = $this->language->get('column_custzip');
		$data['column_custtel'] = $this->language->get('column_custtel');
		$data['column_export_fax'] = $this->language->get('column_export_fax');
		$data['column_import_fax'] = $this->language->get('column_import_fax');
		$data['column_salesrep'] = $this->language->get('column_salesrep');
		

		$data['button_customer_view'] = $this->language->get('button_customer_view');
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
	
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
	
		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}
	
		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}
			
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
	
		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}
	
		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}
	
		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_custkey'])) {$url .= '&filter_custkey=' . urlencode(html_entity_decode($this->request->get['filter_custkey'], ENT_QUOTES, 'UTF-8'));}
		if (isset($this->request->get['filter_custstreet'])) {$url .= '&filter_custstreet=' . $this->request->get['filter_custstreet'];}
		if (isset($this->request->get['filter_custcode'])) {$url .= '&filter_custcode=' . $this->request->get['filter_custcode'];}
		if (isset($this->request->get['filter_custstate'])) {$url .= '&filter_custstate=' .$this->request->get['filter_custstate'];}
		if (isset($this->request->get['filter_custzip'])) {$url .= '&filter_custzip=' . $this->request->get['filter_custzip'];}
		if (isset($this->request->get['filter_custtel'])) {$url .= '&filter_custtel=' . $this->request->get['filter_custtel'];}
		if (isset($this->request->get['filter_custefax'])) {$url .= '&filter_custefax=' . $this->request->get['filter_custefax'];}
		if (isset($this->request->get['filter_custifax'])) {$url .= '&filter_custifax=' . $this->request->get['filter_custifax'];}
		
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}
	
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
	
		$data['sort_name'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_email'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.email' . $url, 'SSL');
		$data['sort_customer_group'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=customer_group' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.status' . $url, 'SSL');
		$data['sort_approved'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.approved' . $url, 'SSL');
		$data['sort_ip'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.ip' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.date_added' . $url, 'SSL');

		$data['sort_custkey'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custkey' . $url, 'SSL');
		$data['sort_custcode'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=CustCode' . $url, 'SSL');
		$data['sort_custstreet'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custstreet' . $url, 'SSL');
		$data['sort_custstate'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custstate' . $url, 'SSL');
		$data['sort_custzip'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custzip' . $url, 'SSL');
		$data['sort_custtel'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custtel' . $url, 'SSL');
		$data['sort_custefax'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custefax' . $url, 'SSL');
		$data['sort_custifax'] = $this->url->link('maintenance/customer_search', 'token=' . $this->session->data['token'] . '&sort=custifax' . $url, 'SSL');
		
		$url = '';
	
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
	
		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}
	
		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}
	
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
	
		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}
	
		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}
	
		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
	
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
	
		if (isset($this->request->get['filter_custkey'])) {$url .= '&filter_custkey=' . urlencode(html_entity_decode($this->request->get['filter_custkey'], ENT_QUOTES, 'UTF-8'));}
		if (isset($this->request->get['filter_custstreet'])) {$url .= '&filter_custstreet=' .$this->request->get['filter_custstreet'];}
		if (isset($this->request->get['filter_custcode'])) {$url .= '&filter_custcode=' . $this->request->get['filter_custcode'];}
		if (isset($this->request->get['filter_custstate'])) {$url .= '&filter_custstate=' .$this->request->get['filter_custstate'];}
		if (isset($this->request->get['filter_custzip'])) {$url .= '&filter_custzip=' . $this->request->get['filter_custzip'];}
		if (isset($this->request->get['filter_custtel'])) {$url .= '&filter_custtel=' . $this->request->get['filter_custtel'];}
		if (isset($this->request->get['filter_custefax'])) {$url .= '&filter_custefax=' . $this->request->get['filter_custefax'];}
		if (isset($this->request->get['filter_custifax'])) {$url .= '&filter_custifax=' . $this->request->get['filter_custifax'];}
		
		$pagination = new Pagination();
		$pagination->total = $customer_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('maintenance/customer', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($customer_total - $this->config->get('config_limit_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $customer_total, ceil($customer_total / $this->config->get('config_limit_admin')));
		
		$data['Use'] = $Use;
		$data['filter_name'] = $filter_name;
		$data['filter_email'] = $filter_email;
		$data['filter_customer_group_id'] = $filter_customer_group_id;
		$data['filter_status'] = $filter_status;
		$data['filter_approved'] = $filter_approved;
		$data['filter_ip'] = $filter_ip;
		$data['filter_date_added'] = $filter_date_added;
	
		$data['filter_custkey'] =  $filter_custkey;
		$data['filter_custcode'] =  $filter_custcode;
		$data['filter_custstreet'] =  $filter_custstreet;
		$data['filter_custstate'] =  $filter_custstate;
		$data['filter_custzip'] =  $filter_custzip;
		$data['filter_custtel'] =  $filter_custtel;
		$data['filter_custefax'] =  $filter_custefax;
		$data['filter_custifax'] =  $filter_custifax;
		$data['filter_salesrep'] =  $filter_salesrep;
		
		
		//$this->load->model('sale/customer_group');
	
		//$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
	
		$this->load->model('setting/store');
	
		$data['stores'] = $this->model_setting_store->getStores();
	
		$data['sort'] = $sort;
		$data['order'] = $order;
	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('maintenance/customer_list.tpl', $data));
	}
	
	
	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_form'] = (!isset($this->session->data['customer_code'])) ? $this->language->get('text_add') : $this->language->get('text_edit');
		
		
		// buttons
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_customer'] = $this->language->get('button_customer');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		// tabs
		$data['tab_customer_general'] = $this->language->get('tab_customer_general');
		$data['tab_customer_options'] = $this->language->get('tab_customer_options');
		$data['tab_customer_acctstats'] = $this->language->get('tab_customer_acctstats');
		$data['tab_customer_salessupp'] = $this->language->get('tab_customer_salessupp');
		$data['tab_customer_ediemail'] = $this->language->get('tab_customer_ediemail');
		$data['tab_customer_same'] = $this->language->get('tab_customer_same');
		$data['tab_customer_lcl'] = $this->language->get('tab_customer_lcl');
		$data['tab_customer_lcl2'] = $this->language->get('tab_customer_lcl2');
		$data['tab_customer_lcl3'] = $this->language->get('tab_customer_lcl3');

		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');
		
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_wait'] = $this->language->get('text_wait');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_add_ban_ip'] = $this->language->get('text_add_ban_ip');
		$data['text_remove_ban_ip'] = $this->language->get('text_remove_ban_ip');
		
		$data['text_customernumber'] = $this->language->get('text_customernumber');
		$data['text_city'] = $this->language->get('text_city');
		$data['text_zip'] = $this->language->get('text_zip');
		$data['text_phone'] = $this->language->get('text_phone');
		$data['text_status'] = $this->language->get('text_status');
		$data['text_contactinfo'] = $this->language->get('text_contactinfo');
		$data['text_customertype'] = $this->language->get('text_customertype');
		$data['text_addressinfo'] = $this->language->get('text_addressinfo');
		$data['text_commissionsalesinfo'] = $this->language->get('text_commissionsalesinfo');
		$data['text_emailinfo'] = $this->language->get('text_emailinfo');
		$data['text_miscinfo'] = $this->language->get('text_miscinfo');
		$data['text_notes'] = $this->language->get('text_notes');
		$data['text_generaloptions'] = $this->language->get('text_generaloptions');
		$data['text_releaseoptions'] = $this->language->get('text_releaseoptions');
		$data['text_lcloptions'] = $this->language->get('text_lcloptions');
		$data['text_fcloptions'] = $this->language->get('text_fcloptions');
		$data['text_importoptions'] = $this->language->get('text_importoptions');
		$data['text_visitorbadge'] = $this->language->get('text_visitorbadge');
		$data['text_creditinfo'] = $this->language->get('text_creditinfo');
		$data['text_specialrates'] = $this->language->get('text_specialrates');
		$data['text_coloadadj'] = $this->language->get('text_coloadadj');
		$data['text_adjtype'] = $this->language->get('text_adjtype');
		$data['text_lclrecentquotes'] = $this->language->get('text_lclrecentquotes');
		$data['text_lclhistoricalquotes'] = $this->language->get('text_lclhistoricalquotes');
		$data['text_fclrecentquotes'] = $this->language->get('text_fclrecentquotes');
		$data['text_fclhistoricalquotes'] = $this->language->get('text_fclhistoricalquotes');
		$data['text_dataentry'] = $this->language->get('text_dataentry');
		$data['text_other'] = $this->language->get('text_other');
		$data['text_actionplan'] = $this->language->get('text_actionplan');
		$data['text_saleshistory'] = $this->language->get('text_saleshistory');
		$data['text_resultcategory'] = $this->language->get('text_resultcategory');
		$data['text_edicodes'] = $this->language->get('text_edicodes');
		$data['text_emailaddress'] = $this->language->get('text_emailaddress');
		$data['text_destinationrates'] = $this->language->get('text_destinationrates');
		$data['text_cfsexception'] = $this->language->get('text_cfsexception');
		$data['text_specialratesportpairs'] = $this->language->get('text_specialratesportpairs');
		$data['text_routingexpectionlist'] = $this->language->get('text_routingexpectionlist');
		$data['text_receiptdetail'] = $this->language->get('text_receiptdetail');
		
		$data['entry_receipt_receipt'] = $this->language->get('entry_receipt_receipt');
		$data['entry_receipt_date'] = $this->language->get('entry_receipt_date');
		$data['entry_receipt_cfs'] = $this->language->get('entry_receipt_cfs');
		$data['entry_receipt_warehouse'] = $this->language->get('entry_receipt_warehouse');
		$data['entry_receipt_pieces'] = $this->language->get('entry_receipt_pieces');
		$data['entry_receipt_lbs'] = $this->language->get('entry_receipt_lbs');
		$data['entry_receipt_cft'] = $this->language->get('entry_receipt_cft');
		$data['entry_receipt_discrepancy'] = $this->language->get('entry_receipt_discrepancy');
		$data['entry_general_code'] = $this->language->get('entry_general_code');
		$data['entry_general_act'] = $this->language->get('entry_general_act');
		$data['entry_general_ina'] = $this->language->get('entry_general_ina');
		$data['entry_general_del'] = $this->language->get('entry_general_del');
		$data['entry_general_prm'] = $this->language->get('entry_general_prm');
		$data['entry_general_sameas'] = $this->language->get('entry_general_sameas');
		$data['entry_general_national'] = $this->language->get('entry_general_national');
		$data['entry_general_name1'] = $this->language->get('entry_general_name1');
		$data['entry_general_name2'] = $this->language->get('entry_general_name2');
		$data['entry_general_voice'] = $this->language->get('entry_general_voice');
		$data['entry_general_expfax'] = $this->language->get('entry_general_expfax');
		$data['entry_general_impfax'] = $this->language->get('entry_general_impfax');
		$data['entry_general_nvo'] = $this->language->get('entry_general_nvo');
		$data['entry_general_ff'] = $this->language->get('entry_general_ff');
		$data['entry_general_propshipper'] = $this->language->get('entry_general_propshipper');
		$data['entry_general_personaleffects'] = $this->language->get('entry_general_personaleffects');
		$data['entry_general_import'] = $this->language->get('entry_general_import');
		$data['entry_general_lcl'] = $this->language->get('entry_general_lcl');
		$data['entry_general_fcl'] = $this->language->get('entry_general_fcl');
		$data['entry_general_imp'] = $this->language->get('entry_general_imp');
		$data['entry_general_terms'] = $this->language->get('entry_general_terms');
		$data['entry_general_billing'] = $this->language->get('entry_general_billing');
		$data['entry_general_sales'] = $this->language->get('entry_general_sales');
		$data['entry_general_inlandcontrol'] = $this->language->get('entry_general_inlandcontrol');
		$data['entry_general_intlcontrol'] = $this->language->get('entry_general_intlcontrol');
		$data['entry_general_usualcomm'] = $this->language->get('entry_general_usualcomm');
		$data['entry_options_domesticwarehousing'] = $this->language->get('entry_options_domesticwarehousing');
		$data['entry_options_nodocreq'] = $this->language->get('entry_options_nodocreq');
		$data['entry_options_noaes'] = $this->language->get('entry_options_noaes');
		$data['entry_options_nobroadcasts'] = $this->language->get('entry_options_nobroadcasts');
		$data['entry_options_deductbrokerage'] = $this->language->get('entry_options_deductbrokerage');
		$data['entry_options_foreignwarehousing'] = $this->language->get('entry_options_foreignwarehousing');
		$data['entry_options_rateallhbl'] = $this->language->get('entry_options_rateallhbl');
		$data['entry_options_unratedproof'] = $this->language->get('entry_options_unratedproof');
		$data['entry_options_deductaes'] = $this->language->get('entry_options_deductaes');
		$data['entry_options_emailonly'] = $this->language->get('entry_options_emailonly');
		$data['entry_options_account'] = $this->language->get('entry_options_account');
		$data['entry_options_usmail'] = $this->language->get('entry_options_usmail');
		$data['entry_options_express'] = $this->language->get('entry_options_express');
		$data['entry_options_jeffron'] = $this->language->get('entry_options_jeffron');
		$data['entry_options_fedex'] = $this->language->get('entry_options_fedex');
		$data['entry_options_addtlemail'] = $this->language->get('entry_options_addtlemail');
		$data['entry_options_quoteoverride'] = $this->language->get('entry_options_quoteoverride');
		$data['entry_options_noquotes'] = $this->language->get('entry_options_noquotes');
		$data['entry_options_griexempt'] = $this->language->get('entry_options_griexempt');
		$data['entry_options_nopreenterproofs'] = $this->language->get('entry_options_nopreenterproofs');
		$data['entry_options_nodetailcollecthbl'] = $this->language->get('entry_options_nodetailcollecthbl');
		$data['entry_options_separatehbladvises'] = $this->language->get('entry_options_separatehbladvises');
		$data['entry_options_showcftonpe'] = $this->language->get('entry_options_showcftonpe');
		$data['entry_options_donotbreakdowncargo'] = $this->language->get('entry_options_donotbreakdowncargo');
		$data['entry_options_alwaysrouted'] = $this->language->get('entry_options_alwaysrouted');
		$data['entry_options_laden'] = $this->language->get('entry_options_laden');
		$data['entry_options_express'] = $this->language->get('entry_options_express');
		$data['entry_options_rated'] = $this->language->get('entry_options_rated');
		$data['entry_options_unrated'] = $this->language->get('entry_options_unrated');
		$data['entry_options_originial'] = $this->language->get('entry_options_originial');
		$data['entry_options_dockreceiptreqd'] = $this->language->get('entry_options_dockreceiptreqd');
		$data['entry_options_allowvehicles'] = $this->language->get('entry_options_allowvehicles');
		$data['entry_options_routedagent'] = $this->language->get('entry_options_routedagent');
		$data['entry_options_warehouserelease'] = $this->language->get('entry_options_warehouserelease');
		$data['entry_options_company'] = $this->language->get('entry_options_company');
		$data['entry_options_name'] = $this->language->get('entry_options_name');
		$data['entry_options_showcustomer'] = $this->language->get('entry_options_showcustomer');
		$data['entry_acctstats_active'] = $this->language->get('entry_acctstats_active');
		$data['entry_acctstats_inactive'] = $this->language->get('entry_acctstats_inactive');
		$data['entry_acctstats_deliq'] = $this->language->get('entry_acctstats_deliq');
		$data['entry_acctstats_perm'] = $this->language->get('entry_acctstats_perm');
		$data['entry_acctstats_einnumber'] = $this->language->get('entry_acctstats_einnumber');
		$data['entry_acctstats_label'] = $this->language->get('entry_acctstats_label');
		$data['entry_acctstats_acxfr'] = $this->language->get('entry_acctstats_acxfr');
		$data['entry_acctstats_routingagentinfo'] = $this->language->get('entry_acctstats_routingagentinfo');
		$data['entry_acctstats_limit'] = $this->language->get('entry_acctstats_limit');
		$data['entry_acctstats_days'] = $this->language->get('entry_acctstats_days');
		$data['entry_acctstats_delinqsince'] = $this->language->get('entry_acctstats_delinqsince');
		$data['entry_acctstats_creditapp'] = $this->language->get('entry_acctstats_creditapp');
		$data['entry_acctstats_appappr'] = $this->language->get('entry_acctstats_appappr');
		$data['entry_acctstats_ccagrmt'] = $this->language->get('entry_acctstats_ccagrmt');
		$data['entry_acctstats_ccappr'] = $this->language->get('entry_acctstats_ccappr');
		$data['entry_acctstats_ctpatsrvy'] = $this->language->get('entry_acctstats_ctpatsrvy');
		$data['entry_acctstats_ctpatrecd'] = $this->language->get('entry_acctstats_ctpatrecd');
		$data['entry_acctstats_poarcvd'] = $this->language->get('entry_acctstats_poarcvd');
		$data['entry_acctstats_discount'] = $this->language->get('entry_acctstats_discount');
		$data['entry_acctstats_premimum'] = $this->language->get('entry_acctstats_premimum');
		$data['entry_acctstats_none'] = $this->language->get('entry_acctstats_none');
		$data['entry_acctstats_percent'] = $this->language->get('entry_acctstats_percent');
		$data['entry_acctstats_dollar'] = $this->language->get('entry_acctstats_dollar');
		$data['entry_acctstats_none'] = $this->language->get('entry_acctstats_none');
		$data['entry_acctstats_adjustamount'] = $this->language->get('entry_acctstats_adjustamount');
		$data['entry_acctstats_aesfiling'] = $this->language->get('entry_acctstats_aesfiling');
		$data['entry_acctstats_agentfee'] = $this->language->get('entry_acctstats_agentfee');
		$data['entry_acctstats_nochass'] = $this->language->get('entry_acctstats_nochass');
		$data['entry_acctstats_quotes'] = $this->language->get('entry_acctstats_quotes');
		$data['entry_acctstats_booking'] = $this->language->get('entry_acctstats_booking');
		$data['entry_acctstats_effective'] = $this->language->get('entry_acctstats_effective');
		$data['entry_acctstats_entry'] = $this->language->get('entry_acctstats_entry');
		$data['entry_acctstats_lastedit'] = $this->language->get('entry_acctstats_lastedit');
		$data['entry_acctstats_split'] = $this->language->get('entry_acctstats_split');
		$data['entry_acctstats_otiid'] = $this->language->get('entry_acctstats_otiid');
		$data['entry_acctstats_addon'] = $this->language->get('entry_acctstats_addon');
		$data['entry_acctstats_ppd'] = $this->language->get('entry_acctstats_ppd');
		$data['entry_acctstats_collect'] = $this->language->get('entry_acctstats_collect');
		$data['entry_acctstats_both'] = $this->language->get('entry_acctstats_both');
		$data['entry_salessupp_actiondate'] = $this->language->get('entry_salessupp_actiondate');
		$data['entry_salessupp_actiontype'] = $this->language->get('entry_salessupp_actiontype');
		$data['entry_salessupp_enteredby'] = $this->language->get('entry_salessupp_enteredby');
		$data['entry_salessupp_entrydate'] = $this->language->get('entry_salessupp_entrydate');
		$data['entry_salessupp_confirm'] = $this->language->get('entry_salessupp_confirm');
		$data['entry_salessupp_history'] = $this->language->get('entry_salessupp_history');
		$data['entry_salessupp_cancel'] = $this->language->get('entry_salessupp_cancel');
		$data['entry_salessupp_actionreqd'] = $this->language->get('entry_salessupp_actionreqd');
		$data['entry_salessupp_nosales'] = $this->language->get('entry_salessupp_nosales');
		$data['entry_salessupp_resultdatetime'] = $this->language->get('entry_salessupp_resultdatetime');
		$data['entry_salessupp_fcl'] = $this->language->get('entry_salessupp_fcl');
		$data['entry_salessupp_lcl'] = $this->language->get('entry_salessupp_lcl');
		$data['entry_salessupp_imp'] = $this->language->get('entry_salessupp_imp');
		$data['entry_salessupp_lss'] = $this->language->get('entry_salessupp_lss');
		$data['entry_salessupp_gen'] = $this->language->get('entry_salessupp_gen');
		$data['entry_salessupp_can'] = $this->language->get('entry_salessupp_can');
		$data['entry_salessupp_mgtreq'] = $this->language->get('entry_salessupp_mgtreq');
		$data['entry_ediemail_wsabombay'] = $this->language->get('entry_ediemail_wsabombay');
		$data['entry_ediemail_wsadelhi'] = $this->language->get('entry_ediemail_wsadelhi');
		$data['entry_ediemail_confreightbelgium'] = $this->language->get('entry_ediemail_confreightbelgium');
		$data['entry_ediemail_emailaddresses'] = $this->language->get('entry_ediemail_emailaddresses');
		$data['entry_ediemail_lcl'] = $this->language->get('entry_ediemail_lcl');
		$data['entry_ediemail_fcl'] = $this->language->get('entry_ediemail_fcl');
		$data['entry_ediemail_imp'] = $this->language->get('entry_ediemail_imp');
		$data['entry_ediemail_contact'] = $this->language->get('entry_ediemail_contact');
		$data['entry_ediemail_emailaddress'] = $this->language->get('entry_ediemail_emailaddress');
		$data['entry_lcl_destination'] = $this->language->get('entry_lcl_destination');
		$data['entry_lcl_agent'] = $this->language->get('entry_lcl_agent');
		$data['entry_lcl_consignee'] = $this->language->get('entry_lcl_consignee');
		$data['entry_lcl_cfs'] = $this->language->get('entry_lcl_cfs');
		$data['entry_lcl_breakpoint'] = $this->language->get('entry_lcl_breakpoint');
		$data['entry_lcl_effectivedate'] = $this->language->get('entry_lcl_effectivedate');
		$data['entry_lcl_cfsadj'] = $this->language->get('entry_lcl_cfsadj');
		$data['entry_lcl_net'] = $this->language->get('entry_lcl_net');
		$data['entry_lcl2_cfsexceptionlist'] = $this->language->get('entry_lcl2_cfsexceptionlist');
		$data['entry_lcl2_code'] = $this->language->get('entry_lcl2_code');
		$data['entry_lcl2_destination'] = $this->language->get('entry_lcl2_destination');
		$data['entry_lcl2_ofratealways'] = $this->language->get('entry_lcl2_ofratealways');
		$data['entry_lcl2_orig'] = $this->language->get('entry_lcl2_orig');
		$data['entry_lcl2_originname'] = $this->language->get('entry_lcl2_originname');
		$data['entry_lcl2_dest'] = $this->language->get('entry_lcl2_dest');
		$data['entry_lcl2_destname'] = $this->language->get('entry_lcl2_destname');
		$data['entry_lcl2_rate'] = $this->language->get('entry_lcl2_rate');
		$data['entry_lcl2_min'] = $this->language->get('entry_lcl2_min');
		$data['entry_lcl2_code'] = $this->language->get('entry_lcl2_code');
		$data['entry_lcl2_service'] = $this->language->get('entry_lcl2_service');
		
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');
		$data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_company_id'] = $this->language->get('entry_company_id');
		$data['entry_tax_id'] = $this->language->get('entry_tax_id');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_default'] = $this->language->get('entry_default');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_amount'] = $this->language->get('entry_amount');
		$data['entry_points'] = $this->language->get('entry_points');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_address'] = $this->language->get('button_add_address');
		$data['button_add_history'] = $this->language->get('button_add_history');
		$data['button_add_transaction'] = $this->language->get('button_add_transaction');
		$data['button_add_reward'] = $this->language->get('button_add_reward');
		$data['button_remove'] = $this->language->get('button_remove');
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_address'] = $this->language->get('tab_address');
		$data['tab_history'] = $this->language->get('tab_history');
		$data['tab_transaction'] = $this->language->get('tab_transaction');
		$data['tab_reward'] = $this->language->get('tab_reward');
		$data['tab_ip'] = $this->language->get('tab_ip');
		
		$data['heading_title'] = $this->language->get('heading_title');
		$this->language->load('maintenance/customer');
	
		if (isset($this->request->get['customer_id'])) {$data['customer_group_id'] = $this->request->get['customer_id'];} else {$data['customer_group_id'] = 0;	}
		if (isset($this->request->get['customer_id'])) {$data['customer_id'] = $this->request->get['customer_id'];} else {$data['customer_id'] = 0;	}
		if (isset($this->session->data['customer_code'])) {$data['customer_code'] = $this->session->data['customer_code'];} else {$data['customer_code'] = '';}
		if (isset($this->session->data['customer_name'])) {$data['customer_name'] = $this->session->data['customer_name'];} else {$data['customer_name'] = '';}
		if (isset($this->session->data['customer_name2'])) {$data['customer_name2'] = $this->session->data['customer_name2'];} else {$data['customer_name2'] = '';}
		if (isset($this->session->data['customer_city'])) {$data['customer_city'] = $this->session->data['customer_city'];} else {$data['customer_city'] = '';}
		if (isset($this->session->data['customer_zip'])) {$data['customer_zip'] = $this->session->data['customer_zip'];} else {$data['customer_zip'] = '';}
		if (isset($this->session->data['customer_state'])) {$data['customer_state'] = $this->session->data['customer_state'];} else {$data['customer_state'] = '';}
		if (isset($this->session->data['customer_tel'])) {$data['customer_tel'] = $this->session->data['customer_tel'];} else {$data['customer_tel'] = '';}
		if (isset($this->session->data['customer_status'])) {$data['customer_status'] = $this->session->data['customer_status'];} else {$data['customer_status'] = '';}
		
		if (isset($this->session->data['customer_nvo'])) {$data['customer_nvo'] = $this->session->data['customer_nvo'];} else {$data['customer_nvo'] = '';}
		if (isset($this->session->data['customer_ff'])) {$data['customer_ff'] = $this->session->data['customer_ff'];} else {$data['customer_ff'] = '';}
		if (isset($this->session->data['customer_shipper'])) {$data['customer_shipper'] = $this->session->data['customer_shipper'];} else {$data['customer_shipper'] = '';}
		if (isset($this->session->data['customer_personal'])) {$data['customer_personal'] = $this->session->data['customer_personal'];} else {$data['customer_personal'] = '';}
		if (isset($this->session->data['customer_import'])) {$data['customer_import'] = $this->session->data['customer_import'];} else {$data['customer_import'] = '';}
		if (isset($this->session->data['customer_cca'])) {$data['customer_cca'] = $this->session->data['customer_cca'];} else {$data['customer_cca'] = '';}
		if (isset($this->session->data['customer_fmc'])) {$data['customer_fmc'] = $this->session->data['customer_fmc'];} else {$data['customer_fmc'] = '';}
		if (isset($this->session->data['customer_chb'])) {$data['customer_chb'] = $this->session->data['customer_chb'];} else {$data['customer_chb'] = '';}
		
		if (isset($this->session->data['customer_same'])) {$data['customer_same'] = $this->session->data['customer_same'];} else {$data['customer_same'] = '';}
		if (isset($this->session->data['customer_national'])) {$data['customer_national'] = $this->session->data['customer_national'];} else {$data['customer_national'] = '';}
		if (isset($this->session->data['customer_street'])) {$data['customer_street'] = $this->session->data['customer_street'];} else {$data['customer_street'] = '';}
		
		
		
		
		if (isset($this->error['warning'])) {$data['error_warning'] = $this->error['warning'];		} else {	$data['error_warning'] = '';		}
		if (isset($this->error['firstname'])) {$data['error_firstname'] = $this->error['firstname'];		} else {			$data['error_firstname'] = '';}
		if (isset($this->error['lastname'])) {$data['error_lastname'] = $this->error['lastname'];		} else {			$data['error_lastname'] = '';		}
		if (isset($this->error['email'])) {$data['error_email'] = $this->error['email'];		} else {			$data['error_email'] = '';		}
		if (isset($this->error['telephone'])) {$data['error_telephone'] = $this->error['telephone'];		} else {			$data['error_telephone'] = '';		}
		if (isset($this->error['password'])) {$data['error_password'] = $this->error['password'];		} else {			$data['error_password'] = '';		}
		if (isset($this->error['confirm'])) {$data['error_confirm'] = $this->error['confirm'];		} else {			$data['error_confirm'] = '';		}
		if (isset($this->error['address_firstname'])) {$data['error_address_firstname'] = $this->error['address_firstname'];	} else {$data['error_address_firstname'] = '';}
		if (isset($this->error['address_lastname'])) {$data['error_address_lastname'] = $this->error['address_lastname'];} else {$data['error_address_lastname'] = '';	}
		if (isset($this->error['address_tax_id'])) {$data['error_address_tax_id'] = $this->error['address_tax_id'];} else {	$data['error_address_tax_id'] = '';	}
		if (isset($this->error['address_address_1'])) {$data['error_address_address_1'] = $this->error['address_address_1'];	} else {			$data['error_address_address_1'] = '';		}
		if (isset($this->error['address_city'])) {$data['error_address_city'] = $this->error['address_city'];		} else {			$data['error_address_city'] = '';		}
		if (isset($this->error['address_postcode'])) {$data['error_address_postcode'] = $this->error['address_postcode'];		} else {			$data['error_address_postcode'] = '';		}
		if (isset($this->error['address_country'])) {$data['error_address_country'] = $this->error['address_country'];		} else {			$data['error_address_country'] = '';		}
		if (isset($this->error['address_zone'])) {$data['error_address_zone'] = $this->error['address_zone'];		} else {			$data['error_address_zone'] = '';		}
		
		if (isset($this->session->data['CustCode'])) {$data['CustCode'] = $this->session->data['CustCode'];} else {$data['CustCode'] = '';}
		
		
		$url = '';
		
		if (isset($this->request->get['filter_name'])) {$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));		}
		if (isset($this->request->get['filter_email'])) {$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));		}
		if (isset($this->request->get['filter_customer_group_id'])) {$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];	}
		if (isset($this->request->get['filter_status'])) {$url .= '&filter_status=' . $this->request->get['filter_status'];		}
		if (isset($this->request->get['filter_approved'])) {$url .= '&filter_approved=' . $this->request->get['filter_approved'];		}
		if (isset($this->request->get['filter_date_added'])) {$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];		}
		if (isset($this->request->get['sort'])) {$url .= '&sort=' . $this->request->get['sort'];		}
		if (isset($this->request->get['order'])) {$url .= '&order=' . $this->request->get['order'];		}
		if (isset($this->request->get['page'])) {$url .= '&page=' . $this->request->get['page'];	}
		
		
		
		if (isset($this->request->post['firstname'])) {	$data['firstname'] = $this->request->post['firstname'];	} elseif (!empty($customer_info)) {$data['firstname'] = $customer_info['firstname'];} else {$data['firstname'] = '';	}
		if (isset($this->request->post['lastname'])) {$data['lastname'] = $this->request->post['lastname'];} elseif (!empty($customer_info)) {$data['lastname'] = $customer_info['lastname'];	} else {$data['lastname'] = '';		}
		
		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';}
		
		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}
		
		if (isset($this->request->post['fax'])) {
			$data['fax'] = $this->request->post['fax'];
		} elseif (!empty($customer_info)) {
			$data['fax'] = $customer_info['fax'];
		} else {
			$data['fax'] = '';
		}
		
		if (isset($this->request->post['newsletter'])) {
			$data['newsletter'] = $this->request->post['newsletter'];
		} elseif (!empty($customer_info)) {
			$data['newsletter'] = $customer_info['newsletter'];
		} else {
			$data['newsletter'] = '';
		}
		
		// test
		
		
		
		
		/*
		if (isset($this->request->post['address'])) {
			$data['addresses'] = $this->request->post['address'];
		} elseif (isset($this->request->get['customer_id'])) {
			$data['addresses'] = $this->model_maintenance_customer->getAddresses($this->request->get['customer_id']);
		} else {
			$data['addresses'] = array();
		}
		
		if (isset($this->request->post['address_id'])) {
			$data['address_id'] = $this->request->post['address_id'];
		} elseif (!empty($customer_info)) {
			$data['address_id'] = $customer_info['address_id'];
		} else {
			$data['address_id'] = '';
		}
// test
		
		
	
	
/*
		if (isset($this->request->post['contact'])) {
			$data['contacts'] = $this->request->post['contact'];
		} elseif (isset($this->request->get['customer_id'])) {
			$data['contacts'] = $this->model_maintenance_customer->getContacts($this->request->get['customer_id']);
		} else {
			$data['contacts'] = array();
		}
		
		if (isset($this->request->post['contact_id'])) {
			$data['contact_id'] = $this->request->post['contact_id'];
		} elseif (!empty($customer_info)) {
			$data['contact_id'] = $customer_info['contact_id'];
		} else {
			$data['contact_id'] = '';
		}
*/		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
	
		$data['breadcrumbs'] = array();
	
		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
		);
	
		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('maintenance/customer', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
		);
	
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
	
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['cancel'] = $this->url->link('maintenance/customer', 'token=' . $this->session->data['token'], 'SSL');
		//$data['contact_details'] = $this->load->controller('sale/customer/edit');
		$data['contact_details'] ='';
		
		$data['token'] = $this->session->data['token'];
	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('maintenance/customer_form.tpl', $data));
		
	}
		
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}
	
		if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}
	
		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}
	
		$customer_info = $this->model_sale_customer->getCustomerByEmail($this->request->post['email']);
	
		if (!isset($this->request->get['customer_id'])) {
			if ($customer_info) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
		} else {
			if ($customer_info && ($this->request->get['customer_id'] != $customer_info['customer_id'])) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
		}
	
		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}
	
		if ($this->request->post['password'] || (!isset($this->request->get['customer_id']))) {
			if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
				$this->error['password'] = $this->language->get('error_password');
			}
	
			if ($this->request->post['password'] != $this->request->post['confirm']) {
				$this->error['confirm'] = $this->language->get('error_confirm');
			}
		}
	
		if (isset($this->request->post['address'])) {
			foreach ($this->request->post['address'] as $key => $value) {
				if ((utf8_strlen($value['firstname']) < 1) || (utf8_strlen($value['firstname']) > 32)) {
					$this->error['address_firstname'][$key] = $this->language->get('error_firstname');
				}
	
				if ((utf8_strlen($value['lastname']) < 1) || (utf8_strlen($value['lastname']) > 32)) {
					$this->error['address_lastname'][$key] = $this->language->get('error_lastname');
				}
	
				if ((utf8_strlen($value['address_1']) < 3) || (utf8_strlen($value['address_1']) > 128)) {
					$this->error['address_address_1'][$key] = $this->language->get('error_address_1');
				}
					
				if ((utf8_strlen($value['city']) < 2) || (utf8_strlen($value['city']) > 128)) {
					$this->error['address_city'][$key] = $this->language->get('error_city');
				}
	
				$this->load->model('localisation/country');
	
				$country_info = $this->model_localisation_country->getCountry($value['country_id']);
	
				if ($country_info) {
					if ($country_info['postcode_required'] && (utf8_strlen($value['postcode']) < 2) || (utf8_strlen($value['postcode']) > 10)) {
						$this->error['address_postcode'][$key] = $this->language->get('error_postcode');
					}
						
					// VAT Validation
					$this->load->helper('vat');
						
					if ($this->config->get('config_vat') && $value['tax_id'] && (vat_validation($country_info['iso_code_2'], $value['tax_id']) == 'invalid')) {
						$this->error['address_tax_id'][$key] = $this->language->get('error_vat');
					}
				}
					
				if ($value['country_id'] == '') {
					$this->error['address_country'][$key] = $this->language->get('error_country');
				}
	
				if (!isset($value['zone_id']) || $value['zone_id'] == '') {
					$this->error['address_zone'][$key] = $this->language->get('error_zone');
				}
			}
		}
	
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
	
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		 
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	public function clear(){
	
		$dontDelete = array('user_id','token','currency','booking','quote' );
			
		foreach($this->session->data as $key => $value) {if (!in_array($key,$dontDelete)) {unset($this->session->data[$key]);}}
			
		$this->response->redirect($this->url->link('maintenance/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
	}
	
	public function login() {
		$json = array();
	
		if (isset($this->request->get['customer_id'])) {
			$customer_id = $this->request->get['customer_id'];
		} else {
			$customer_id = 0;
		}
	
		$this->load->model('sale/customer');
	
		$customer_info = $this->model_sale_customer->getCustomer($customer_id);
	
		if ($customer_info) {
			$token = md5(mt_rand());
				
			$this->model_sale_customer->editToken($customer_id, $token);
				
			if (isset($this->request->get['store_id'])) {
				$store_id = $this->request->get['store_id'];
			} else {
				$store_id = 0;
			}
				
			$this->load->model('setting/store');
				
			$store_info = $this->model_setting_store->getStore($store_id);
				
			if ($store_info) {
				$this->redirect($store_info['url'] . 'index.php?route=account/login&token=' . $token);
			} else {
				$this->redirect(HTTP_CATALOG . 'index.php?route=account/login&token=' . $token);
			}
		} else {
			$this->language->load('error/not_found');
	
			$this->document->setTitle($this->language->get('heading_title'));
	
			$data['heading_title'] = $this->language->get('heading_title');
	
			$data['text_not_found'] = $this->language->get('text_not_found');
	
			$data['breadcrumbs'] = array();
	
			$data['breadcrumbs'][] = array(
					'text'      => $this->language->get('text_home'),
					'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
					'separator' => false
			);
	
			$data['breadcrumbs'][] = array(
					'text'      => $this->language->get('heading_title'),
					'href'      => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
					'separator' => ' :: '
			);
	
			$this->template = 'error/not_found.tpl';
			$this->children = array(
					'common/header',
					'common/footer'
			);
	
			$this->response->setOutput($this->render());
		}
	}
	
	public function history() {
		$this->language->load('sale/customer');
	
		$this->load->model('sale/customer');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'sale/customer')) {
			$this->model_sale_customer->addHistory($this->request->get['customer_id'], $this->request->post['comment']);
	
			$data['success'] = $this->language->get('text_success');
		} else {
			$data['success'] = '';
		}
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'sale/customer')) {
			$data['error_warning'] = $this->language->get('error_permission');
		} else {
			$data['error_warning'] = '';
		}
	
		$data['text_no_results'] = $this->language->get('text_no_results');
	
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_comment'] = $this->language->get('column_comment');
	
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
	
		$data['histories'] = array();
			
		$results = $this->model_sale_customer->getHistories($this->request->get['customer_id'], ($page - 1) * 10, 10);
	
		foreach ($results as $result) {
			$data['histories'][] = array(
					'comment'     => $result['comment'],
					'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}
	
		$transaction_total = $this->model_sale_customer->getTotalHistories($this->request->get['customer_id']);
			
		$pagination = new Pagination();
		$pagination->total = $transaction_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/customer/history', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . '&page={page}', 'SSL');
			
		$data['pagination'] = $pagination->render();
	
		$this->template = 'sale/customer_history.tpl';
	
		$this->response->setOutput($this->render());
	}
	
	public function transaction() {
		$this->language->load('sale/customer');
	
		$this->load->model('sale/customer');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'sale/customer')) {
			$this->model_sale_customer->addTransaction($this->request->get['customer_id'], $this->request->post['description'], $this->request->post['amount']);
	
			$data['success'] = $this->language->get('text_success');
		} else {
			$data['success'] = '';
		}
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'sale/customer')) {
			$data['error_warning'] = $this->language->get('error_permission');
		} else {
			$data['error_warning'] = '';
		}
	
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_balance'] = $this->language->get('text_balance');
	
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_description'] = $this->language->get('column_description');
		$data['column_amount'] = $this->language->get('column_amount');
	
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
	
		$data['transactions'] = array();
			
		$results = $this->model_sale_customer->getTransactions($this->request->get['customer_id'], ($page - 1) * 10, 10);
	
		foreach ($results as $result) {
			$data['transactions'][] = array(
					'amount'      => $this->currency->format($result['amount'], $this->config->get('config_currency')),
					'description' => $result['description'],
					'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}
	
		$data['balance'] = $this->currency->format($this->model_sale_customer->getTransactionTotal($this->request->get['customer_id']), $this->config->get('config_currency'));
	
		$transaction_total = $this->model_sale_customer->getTotalTransactions($this->request->get['customer_id']);
			
		$pagination = new Pagination();
		$pagination->total = $transaction_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/customer/transaction', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . '&page={page}', 'SSL');
			
		$data['pagination'] = $pagination->render();
	
		$this->template = 'sale/customer_transaction.tpl';
	
		$this->response->setOutput($this->render());
	}
		
	public function reward() {
		$this->language->load('sale/customer');
	
		$this->load->model('sale/customer');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'sale/customer')) {
			$this->model_sale_customer->addReward($this->request->get['customer_id'], $this->request->post['description'], $this->request->post['points']);
	
			$data['success'] = $this->language->get('text_success');
		} else {
			$data['success'] = '';
		}
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'sale/customer')) {
			$data['error_warning'] = $this->language->get('error_permission');
		} else {
			$data['error_warning'] = '';
		}
	
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_balance'] = $this->language->get('text_balance');
	
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_description'] = $this->language->get('column_description');
		$data['column_points'] = $this->language->get('column_points');
	
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
	
		$data['rewards'] = array();
			
		$results = $this->model_sale_customer->getRewards($this->request->get['customer_id'], ($page - 1) * 10, 10);
	
		foreach ($results as $result) {
			$data['rewards'][] = array(
					'points'      => $result['points'],
					'description' => $result['description'],
					'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}
	
		$data['balance'] = $this->model_sale_customer->getRewardTotal($this->request->get['customer_id']);
	
		$reward_total = $this->model_sale_customer->getTotalRewards($this->request->get['customer_id']);
			
		$pagination = new Pagination();
		$pagination->total = $reward_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/customer/reward', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . '&page={page}', 'SSL');
			
		$data['pagination'] = $pagination->render();
	
		$this->template = 'sale/customer_reward.tpl';
	
		$this->response->setOutput($this->render());
	}
	
	public function addBanIP() {
		$this->language->load('sale/customer');
	
		$json = array();
	
		if (isset($this->request->post['ip'])) {
			if (!$this->user->hasPermission('modify', 'sale/customer')) {
				$json['error'] = $this->language->get('error_permission');
			} else {
				$this->load->model('sale/customer');
	
				$this->model_sale_customer->addBanIP($this->request->post['ip']);
	
				$json['success'] = $this->language->get('text_success');
			}
		}
	
		$this->response->setOutput(json_encode($json));
	}
	
	public function removeBanIP() {
		$this->language->load('sale/customer');
	
		$json = array();
	
		if (isset($this->request->post['ip'])) {
			if (!$this->user->hasPermission('modify', 'sale/customer')) {
				$json['error'] = $this->language->get('error_permission');
			} else {
				$this->load->model('sale/customer');
	
				$this->model_sale_customer->removeBanIP($this->request->post['ip']);
	
				$json['success'] = $this->language->get('text_success');
			}
		}
	
		$this->response->setOutput(json_encode($json));
	}
	
	public function autocomplete() {
		$json = array();
	
		if (isset($this->request->get['filter_name'])) {
			$this->load->model('sale/customer');
				
			$data = array(
					'filter_name' => $this->request->get['filter_name'],
					'start'       => 0,
					'limit'       => 20
			);
	
			$results = $this->model_sale_customer->getCustomers($data);
				
			foreach ($results as $result) {
				$json[] = array(
						'customer_id'       => $result['customer_id'],
						'customer_group_id' => $result['customer_group_id'],
						'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
						'customer_group'    => $result['customer_group'],
						'firstname'         => $result['firstname'],
						'lastname'          => $result['lastname'],
						'email'             => $result['email'],
						'telephone'         => $result['telephone'],
						'fax'               => $result['fax'],
						'address'           => $this->model_sale_customer->getAddresses($result['customer_id'])
				);
			}
		}
	
		$sort_order = array();
		 
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}
	
		array_multisort($sort_order, SORT_ASC, $json);
	
		$this->response->setOutput(json_encode($json));
	}
	
public function autocomplete_contact() {
		$json = array();
	
		if (isset($this->request->get['filter_name'])) {
			$this->load->model('sale/customer');
				
			$data = array(
					'filter_name' => $this->request->get['filter_name'],
					'CustCode'	  => $this->session->data['customer'],
					'start'       => 0,
					'limit'       => 20
			);
	
			$results = $this->model_sale_customer->getCustomers($data);
				
			foreach ($results as $result) {
				$json[] = array(
						'customer_id'       => $result['customer_id'],
						'customer_group_id' => $result['customer_group_id'],
						'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
						'customer_group'    => $result['customer_group'],
						'firstname'         => $result['firstname'],
						'lastname'          => $result['lastname'],
						'email'             => $result['email']
						
				);
			}
		}
	
		$sort_order = array();
		 
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}
	
		array_multisort($sort_order, SORT_ASC, $json);

		$this->session->data['contact_test_2'] = $json;
		$this->response->setOutput(json_encode($json));
	}
	
	
	public function get_sugar_contact(){
		if (isset($this->session->data['customer'])){
			$soap=new SugarSoap('http://troycontainerline.com/sugar/soap.php?wsdl',true); // automatically log in
			$this->session->data['account_id']	=  $result['entry_list'][0]['name_value_list'][7]['value']; //set login ID to add contacts
		}
	}
	public function get_contact() {
		$json = array();
		if (isset($this->request->get['filter_name'])) {
			if (isset($this->session->data['customer'])){
				
			$soap=new SugarSoap('http://troycontainerline.com/sugar/soap.php?wsdl',true); // automatically log in
	
			$result=$soap->getContacts(floatval($this->session->data['customer']));
			$this->session->data['account_id']	=  $result['entry_list'][0]['name_value_list'][7]['value']; //set login ID to add contacts
			
				foreach ($result['entry_list'] as $record) {
						
					$array= $soap->nameValuePairToSimpleArray($record['name_value_list']);
						
					$json[] = array(
							'customer_id'		=> $array['id'],
							'customer_group_id' => $array['custcode_c'],
							'name'              => strip_tags(html_entity_decode($array['first_name'] . " ".$array['last_name'], ENT_QUOTES, 'UTF-8')),
							'customer_group'    => $array['account_name'],
							'firstname'         => $array['first_name'],
							'lastname'          => $array['last_name'],
							'email'             => $array['email1']
					);
				}
			}
		}
		
		$sort_order = array();
	
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}
	
		array_multisort($sort_order, SORT_ASC, $json);
		
		$this->session->data['contact_test_2'] = $json;
		$this->response->setOutput(json_encode($json));
		
	}
	
	public function addContact(){
		unset($this->session->data['error_warning']);
			
		$url = '';
		
		$data['addContact'] = $this->url->link('maintenance/customer', 'token=' . $this->session->data['token'], 'SSL');
				
				$output  = '<html dir="ltr" lang="en">' . "\n";
				$output .= '<head>' . "\n";
				$output .= '<title>Add Contact</title>' . "\n";
				$output .= '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
				$output .= '<meta name="robots" content="noindex">' . "\n";
				$output .= '<script type="text/javascript">$("input[name=first_name]").live("change",function(){var first_name = $("#first_name").val();$.post("controller/setting/ajaxpersist.php", {"fieldname" : "first_name","value":first_name});$("input[name=\"first_name\"]").val(first_name);});</script>' . "\n";
				$output .= '<script type="text/javascript">$("input[name=last_name]").live("change",function(){var last_name = $("#last_name").val();$.post("controller/setting/ajaxpersist.php", {"fieldname" : "last_name","value":last_name});$("input[name=\"last_name\"]").val(last_name);});</script>' . "\n";
				$output .= '<script type="text/javascript">$("input[name=phone]").live("change",function(){var phone = $("#phone").val();$.post("controller/setting/ajaxpersist.php", {"fieldname" : "phone","value":phone});$("input[name=\"phone\"]").val(phone);});</script>' . "\n";
				$output .= '<script type="text/javascript">$("input[name=email1]").live("change",function(){var email1 = $("#email1").val();$.post("controller/setting/ajaxpersist.php", {"fieldname" : "email1","value":email1});$("input[name=\"email1\"]").val(email1);});</script>' . "\n";
				$output .= '</head>' . "\n";
				$output .= '<body style="background:url(/view/image/troy_logo.png);">' . "\n";
				$output .= ' <img src="view/image/troy_logo.png"/>' . "\n";
				$output .= '  <h1>&nbsp;  Add Contacts -<i> Quick Method - </i></h1>' . "\n";
				$output .= '  <div style="border:6px ridge green;" align="center">' . "\n";
				$output .= '  <h3>First Name: <input type="text" id="first_name" name="first_name" size="30"/></h3>' . "\n";
				$output .= '  <h3>Last Name: <input type="text" id="last_name" name="last_name" size="30"/></h3>' . "\n";
				$output .= '  <h3>Telephone: <input type="text" id="phone" name="phone" size="30"/></h3>' . "\n";
				$output .= '  <h3>Email Address: <input type="text" id="email1" name="email1" size="50"/></h3>' . "\n";
				$output .= '  </div><br><br>' . "\n";
				$output .= '  <div class="buttons" align="center"><a href=' . $this->url->link('maintenance/customer/newContact', 'token=' . $this->session->data['token']. $url , 'SSL').' class="button">Add Contact</a> <br>' . "\n";
				$output .= '  <br><span class="help">Use this form to quickly add NEW Contact information to this Customer. ' . "\n";
				$output .= '  Update the remaining contact information using <a>Customer Maintenance</a> > Customers > Contact Info tab.</span> ' . "\n";
				$output .= '  </body>' . "\n";
				$output .= '</html>' . "\n";
				
				$this->response->setOutput($output);
			
	}
	public function newContact() {
		$client=new SugarSoap('http://troycontainerline.com/sugar/soap.php?wsdl',true); // we automatically log in
		
		if(isset($this->session->data['sugar_session_id'])){
			$contact = array(
					"account_id"	=>$this->session->data['account_id'],
					"last_name"		=>$this->session->data['last_name'],
					"first_name"	=>$this->session->data['first_name'],
					"email1"    	=>$this->session->data['email1'],
					"phone_work"    =>$this->session->data['phone'],
					"custcode_c"    =>(int)$this->session->data['customer']
					
			);
			
			$Contact_check = $client->checkContact($contact);
			
			if($Contact_check){
				$this->session->data['success'] =  "New Contact, <b>". $this->session->data['first_name'] ." ". $this->session->data['last_name']." </b>has been added.";
				
				$addContact = $client->setContact($contact);
				
				$this->load->model('maintenance/customer');
				$contact['custcode'] = $this->session->data['customer'];
				
				$this->model_maintenance_customer->addContact_short($contact);
						
			} else{
				$this->session->data['error_notype'] =  "New Contact not added, already exists!";
			}

		} else {

			$this->session->data['error_warning'] = "Please Logout and Login again to connect to the Contact Management System.";
		}
		
		
		if(isset($this->session->data['contact_source']) && $this->session->data['contact_source']=='booking' ){
			$this->redirect($this->url->link('service/booking/insert', 'token=' . $this->session->data['token'], 'SSL'));
			
		}
		
		if(isset($this->session->data['contact_source']) && $this->session->data['contact_source']=='quotation' ){
			$this->redirect($this->url->link('service/quotations/insert', 'token=' . $this->session->data['token'], 'SSL'));
			
		}
	}
	
	public function country() {
		$json = array();
	
		$this->load->model('localisation/country');
		
		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);
	
		if ($country_info) {
			$this->load->model('localisation/zone');
	
			$json = array(
					'country_id'        => $country_info['country_id'],
					'name'              => $country_info['name'],
					'iso_code_2'        => $country_info['iso_code_2'],
					'iso_code_3'        => $country_info['iso_code_3'],
					'address_format'    => $country_info['address_format'],
					'postcode_required' => $country_info['postcode_required'],
					'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
					'status'            => $country_info['status']
			);
		}
	
		$this->response->setOutput(json_encode($json));
	}
	
	public function address() {
		$json = array();
	
		if (!empty($this->request->get['address_id'])) {
			$this->load->model('sale/customer');
				
			$json = $this->model_sale_customer->getAddress($this->request->get['address_id']);
		}
	
		$this->response->setOutput(json_encode($json));
	}
	
	public function getContacts(){
		#-- http://www.beanizer.org/site/index.php/en/Articles/Sugar-CRM-integration-with-custom-PHP-applications-II.html	
		#-- http://developer.sugarcrm.com/2010/11/12/howto-search-for-a-record-via-email-address-via-web-services/	
		
		$json = array();
	
		if (isset($this->session->data['customer'])){
			
		$soap=new SugarSoap('http://troycontainerline.com/sugar/soap.php?wsdl',true); // we automatically log in
		
		$result=$soap->getContacts(floatval($this->session->data['customer']));
		$this->session->data['contacts_test'] = array();
		$this->session->data['first_name'] = array();
		$this->session->data['last_name'] = array();
		$this->session->data['email1'] = array();
		
		if($result['result_count']>0){
			foreach($result['entry_list'] as $record){
				$array= $soap->nameValuePairToSimpleArray($record['name_value_list']);
				$this->session->data['first_name'][]= $array['first_name'];
				$this->session->data['last_name'][]= $array['last_name'];
				$this->session->data['email1'][]= $array['email1'];
				$this->session->data['contacts_test'][]= $array['first_name'] . " ".$array['last_name'] . " - " . $array['email1']. " - " . $array['account_name']." ".$array['account_id'];
				
			}
		}
		
		$query = "select contacts.id from contacts as contacts left join contacts_cstm as custom on custom.id_c = contacts.id join email_addr_bean_rel as emailbean on emailbean.bean_id = contacts.id where custom.custcode_c = '5653'";
		
		$this->response->redirect($this->url->link('common/home/sessioninfo', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
	   }


		}
		
	public function getSugar(){
		//$client=new SugarSoap('http://troycontainerline.com/sugar/soap.php?wsdl',true); // we automatically log in
		//http://www.lornajane.net/posts/2008/sugarcrm-soap-api-examples
		// look for a particular account name and then get its IDarray(
        //		$test= array("name" => 'name',"custcode_c" =>'123456');
        //		$response = $client->setEntry('Accounts',$test);
        //		$account_id = $response['id'];
        
        // create a new contact record, assigned to this account, and grab the contact ID
        $client=new SugarSoap('http://troycontainerline.com/sugar/soap.php?wsdl',true); // we automatically log in
		
		$contact = array(
				"account_id"	=>$this->session->data['account_id'],
				"last_name"		=>$data['last_name'],
				"first_name"	=>$data['first_name'],
				"email1"    	=>$data['email1'],
				"custcode_c"    =>$this->session->data['customer']
		);
		
		$addContact = $client->setContact($contact);
		
		//http://books.google.com/books?id=EYhKc1gFz2gC&lpg=PA69&ots=OclOGfgkXb&dq=add%20contact%20soap%20sugarcrm%20set%20entry&pg=PA70#v=onepage&q=add%20contact%20soap%20sugarcrm%20set%20entry&f=false
	}

}

?>