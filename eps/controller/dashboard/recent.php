<?php
class ControllerDashboardRecent extends Controller {
	public function index() {
		$this->load->language('dashboard/recent');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['column_customer'] = $this->language->get('column_customer');
		$data['column_booking_id'] = $this->language->get('column_booking_id');
		$data['column_service_from'] = $this->language->get('column_service_from');
		$data['column_service_to'] = $this->language->get('column_service_to');
		$data['column_bookedby'] = $this->language->get('column_bookedby');
		
		$data['button_view'] = $this->language->get('button_view');

		$data['token'] = $this->session->data['token'];
		
		//Last 5 Booking
		$data['bookings'] = array();
		
		$data['filter_data'] = array(
				'sort'  => 'BKdate desc, bkpremod ',
				'order' => 'DESC',
				'start' => 0,
				'limit' => 10
		);
		$this->load->model('service/booking');
		$results = $this->model_service_booking->getLastBookings($data['filter_data']);
		
		foreach ($results as $result) {
			$action = array();
		
			$action[] = array(
					'text' => $this->language->get('text_view'),
					'href' => $this->url->link('service/booking/update', 'token=' . $this->session->data['token'] . '&booking_no=' . $result['BKRef'], 'SSL')
			);
		
			$data['bookings'][] = array(
					'booking_no'         => $result['BKRef'],
					'customer'           => $result['CustName1'],
					'service_from'       => $this->model_service_service->getPortofLoading_name($result['BkOrig']),
					'service_to'         => $this->model_service_service->getPortofDestination_name($result['BkDest']),
					//'date_added'       => date($this->language->get('date_format_short'), strtotime($result['BKdate'])),
					'bookedby'			 => $result['BkUser'],
					'action'     		 => $action
		
			);
		}
		
		
		

		return $this->load->view('dashboard/recent.tpl', $data);
	}
}
