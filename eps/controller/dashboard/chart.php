<?php
class ControllerDashboardChart extends Controller {
	public function index() {
		$this->load->language('dashboard/chart');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_day'] = $this->language->get('text_day');
		$data['text_week'] = $this->language->get('text_week');
		$data['text_month'] = $this->language->get('text_month');
		$data['text_year'] = $this->language->get('text_year');
		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		return $this->load->view('dashboard/chart.tpl', $data);
	}

	public function chart() {
		$this->load->language('dashboard/chart');

		$json = array();

		$this->load->model('report/eps');

		$json['received'] = array();
		$json['open'] = array();

		$json['strategic'] = array();
		$json['packaged'] = array();

		$json['xaxis'] = array();

		$json['received']['label'] = $this->language->get('text_strategic');
		$json['open']['label'] = $this->language->get('text_packaged');

		$json['received']['data'] = array();
		$json['open']['data'] = array();


		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'day';
		}

		//$booking_total = $this->model_service_booking->getTotalBookings(array('filter_date_since_added' => $date_till->format('Y-d-m')));

		switch ($range) {
			default:
			case 'day':
				$results = $this->model_report_eps->getTotalReceivedBookingByDay();


				foreach ($results as $key => $value) {
					$json['received']['data'][] = array($key, $value['total']);
				}

				$results = $this->model_report_eps->getTotalOpenBookingByDay();

				foreach ($results as $key => $value) {
					$json['open']['data'][] = array($key, $value['total']);
				}

				for ($i = 0; $i < 24; $i++) {
					$json['xaxis'][] = array($i, $i);
				}
				break;
			case 'week':
				$results = $this->model_report_eps->getTotalReceivedBookingByWeek();

				foreach ($results as $key => $value) {
					$json['received']['data'][] = array($key, $value['total']);
				}

				$results = $this->model_report_eps->getTotalOpenBookingByWeek();

				foreach ($results as $key => $value) {
					$json['open']['data'][] = array($key, $value['total']);
				}

				$date_start = strtotime('-' . date('w') . ' days');

				for ($i = 0; $i < 7; $i++) {
					$date = date('Y-m-d', $date_start + ($i * 86400));

					$json['xaxis'][] = array(date('w', strtotime($date)), date('D', strtotime($date)));
				}
				break;
			case 'month':
				$results = $this->model_report_eps->getTotalReceivedBookingByMonth();

				foreach ($results as $key => $value) {
					$json['received']['data'][] = array($key, $value['total']);
				}

				$results = $this->model_report_eps->getTotalOpenBookingByMonth();

				foreach ($results as $key => $value) {
					$json['open']['data'][] = array($key, $value['total']);
				}

				for ($i = 1; $i <= date('t'); $i++) {
					$date = date('Y') . '-' . date('m') . '-' . $i;

					$json['xaxis'][] = array(date('j', strtotime($date)), date('d', strtotime($date)));
				}
				break;
			case 'year':
				$results = $this->model_report_eps->getTotalReceivedBookingByYear();

				foreach ($results as $key => $value) {
					$json['received']['data'][] = array($key, $value['total']);
				}

				$results = $this->model_report_eps->getTotalOpenBookingByYear();

				foreach ($results as $key => $value) {
					$json['open']['data'][] = array($key, $value['total']);
				}

				for ($i = 1; $i <= 12; $i++) {
					$json['xaxis'][] = array($i, date('M', mktime(0, 0, 0, $i)));
				}
				break;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}



}
