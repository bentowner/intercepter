<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$data['base'] = HTTPS_SERVER;
		} else {
			$data['base'] = HTTP_SERVER;
		}

		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$this->load->language('common/header');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_order'] = $this->language->get('text_order');
		$data['text_order_status'] = $this->language->get('text_order_status');
		$data['text_complete_status'] = $this->language->get('text_complete_status');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_customer'] = $this->language->get('text_customer');
		$data['text_online'] = $this->language->get('text_online');
		$data['text_approval'] = $this->language->get('text_approval');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_review'] = $this->language->get('text_review');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_store'] = $this->language->get('text_store');
		$data['text_front'] = $this->language->get('text_front');
		$data['text_help'] = $this->language->get('text_help');
		$data['text_homepage'] = $this->language->get('text_homepage');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
		$data['text_logout'] = $this->language->get('text_logout');

		$data['text_booking'] = $this->language->get('text_booking');
		$data['text_drafts'] = $this->language->get('text_drafts');
		$data['text_open'] = $this->language->get('text_open');
		$data['text_received'] = $this->language->get('text_received');
		$data['text_on_hold'] = $this->language->get('text_on_hold');
		$data['text_quotes'] = $this->language->get('text_quotes');
		$data['text_expire'] = $this->language->get('text_expire');
		$data['text_valid_quotes'] = $this->language->get('text_valid_quotes');
		$data['text_it_ticket'] = $this->language->get('text_it_ticket');
		$data['text_sugar'] = $this->language->get('text_sugar');

		if (!isset($this->request->get['token']) || !isset($this->session->data['token']) && ($this->request->get['token'] != $this->session->data['token'])) {
			$data['logged'] = '';

			$data['home'] = $this->url->link('common/dashboard', '', 'SSL');
		} else {
			$data['logged'] = true;

			$data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');
			$data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], 'SSL');


			// Booking
			$this->load->model('service/booking');

			$data['booking_draft_total'] =  $this->model_service_booking->totalBookingObjects();
			$data['booking_open_status_total'] =$this->model_service_booking->getTotalBookings(array('filter_status' => 'O'));
			$data['booking_received_status_total'] = $this->model_service_booking->getTotalBookings(array('filter_status' => 'R'));

			$booking_hold_total =  $this->model_service_booking->getTotalBookings(array('filter_status' => 'H'));
			$data['booking_hold_total']=$booking_hold_total;
			$data['booking_draft'] = $this->url->link('service/booking', 'token=' . $this->session->data['token'].'&draft=true', 'SSL');
			$data['booking_open'] = $this->url->link('service/booking', 'token=' . $this->session->data['token'].'&filter_status=O', 'SSL');
			$data['booking_received'] = $this->url->link('service/booking', 'token=' . $this->session->data['token'].'&filter_status=R', 'SSL');
			$data['booking_hold'] = $this->url->link('service/booking', 'token=' . $this->session->data['token'].'&filter_status=H', 'SSL');


			/**
			 *  @todo:  If the web becomes the portal for clients then this is relevent - Customers
			 */
			// Customers online
			$this->load->model('report/customer');

			$data['online_total'] = $this->model_report_customer->getTotalCustomersOnline();

			$data['online'] = $this->url->link('report/customer_online', 'token=' . $this->session->data['token'], 'SSL');

			$this->load->model('sale/customer');

			$customer_total = $this->model_sale_customer->getTotalCustomers(array('filter_approved' => false));

			$data['customer_total'] = $customer_total;
			$data['customer_approval'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&filter_approved=0', 'SSL');

			//Quotes
			$this->load->model('service/quotations');

			$data['quote_draft_total'] =  $this->model_service_quotations->totalQuoteObjects();
			$data['quote_draft'] = $this->url->link('service/quotations', 'token=' . $this->session->data['token'].'&draft=true', 'SSL');
			$data['quote_valid'] = $this->url->link('service/quotations', 'token=' . $this->session->data['token'].'&filter_expire=true', 'SSL');
			$data['quote_expire'] = $this->url->link('service/booking', 'token=' . $this->session->data['token'].'&filter_expire=true', 'SSL');

			//$data['quote_total'] = '10';
			$data['quote_total'] = $this->model_service_quotations->getValidQuoteCount();

			$today =  new datetime();
			$quote_expire = $this->model_service_quotations->getValidQuoteCount(array('filter_date' =>$today->format('Y-m-d')));

			$data['quote_expire'] = $quote_expire;

			$data['alerts'] = $booking_hold_total + $quote_expire ;

			//Arrivals
			$data['arrival_total'] = '0';

			$data['splendidCRM'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');
			$data['IT_ticket'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');

			// Online Stores
			$data['stores'] = array();

			$data['stores'][] = array(
				'name' => $this->config->get('config_name'),
				'href' => HTTP_CATALOG
			);

			$this->load->model('setting/store');

			$results = $this->model_setting_store->getStores();

			foreach ($results as $result) {
				$data['stores'][] = array(
					'name' => $result['name'],
					'href' => $result['url']
				);
			}
		}

		return $this->load->view('common/header.tpl', $data);
	}



}
