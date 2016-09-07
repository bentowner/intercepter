<?php
class ControllerCommonDashboard extends Controller {
	public function index() {
		$this->load->language('common/dashboard');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');
		$data['text_overview'] = $this->language->get('text_overview');
		$data['text_employee'] = $this->language->get('text_employee');
		$data['text_total_booking_number'] = $this->language->get('text_total_booking_number');
		$data['text_total_quotes_number'] = $this->language->get('text_total_quotes_number');
		$data['text_total_customer'] = $this->language->get('text_total_customer');
		$data['text_total_customer_approval'] = $this->language->get('text_total_customer_approval');

		/*
		$this->load->model('tool/image');
		$data['compass'] = $this->model_tool_image->resize('troy_image.png', 45, 45);
		*/

		$this->load->model('service/service');

		$data['webquote_link'] = $this->url->link('service/quotations', 'token=' . $this->session->data['token'] .'&filter_webquotes=true', 'SSL');
		$data['webquotes']= $this->model_service_service->get30Quotes_website();
		$data['total_quotes'] = number_format($this->model_service_service->getTotalNoQuotes(),0);
		$data['total_booking'] = number_format($this->model_service_service->getTotalBookings(),0);

		if (isset($this->session->data['success_admin'])) {$data['success_admin'] = $this->session->data['success_admin'];
		unset($this->session->data['success_admin']);
		} else {$data['success_admin'] = '';}

		if (isset($this->session->data['error_warning_admin'])) {$data['error_warning_admin'] = $this->session->data['error_warning_admin'];
		unset($this->session->data['error_warning_admin']);} else {$data['error_warning_admin'] = '';}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$this->document->addScript('view/javascript/shortcut.js');

		$data['help']= $this->load->controller('setting/help');

		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');

		$data['strategicinit'] = $this->load->controller('dashboard/strategicinit');
		$data['packagedsolution'] = $this->load->controller('dashboard/packagedsolution');
		$data['customsolution'] = $this->load->controller('dashboard/customsolution');
		$data['dealsupport'] = $this->load->controller('dashboard/dealsupport');
		$data['online'] = $this->load->controller('dashboard/online');

		$data['employee'] = $this->load->controller('dashboard/employee');
		$data['workload'] = $this->load->controller('dashboard/workload');
		$data['chart'] = $this->load->controller('dashboard/chart');

		$data['activity'] = $this->load->controller('dashboard/activity');

		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('common/dashboard.tpl', $data));
	}


	public function settings(){

		$dontDelete = array('user_id','token','currency','object','booking','quote','customer_object','success_admin','drafts','sugar_session_id');

		$object = serialize($dontDelete);


	}

	public function set_eps(){
		$config_admin_language = array('language_id','directory');
		$object = serialize($config_admin_language);
		$this->db->query("insert INTO `eps_setting`(`store_id`,`code`,`key`,`value`,`serialized`) VALUES ('0','config','config_admin_language','.$config_admin_language.','0';");

	}

}
