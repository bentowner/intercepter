<?php
class ControllerDashboardPackagedsolution extends Controller {
	public function index() {
		$this->load->language('dashboard/Popackagesolution');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Quote
		$this->load->model('service/quotations');

		$today = new datetime();
		$newTZ = new DateTimeZone("America/New_York");
		$today->setTimezone( $newTZ );
		$today_date = $today->format('Y-m-d');

		$today = $this->model_service_quotations->getTotalQuotes(array('filter_date_added' => $today_date));

		$yesterday = $this->model_service_quotations->getTotalQuotes(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$date_till = new datetime('2015-01-01');

		$quote_total = $this->model_service_quotations->getTotalQuotes(array('filter_date_since_added' => $date_till->format('Y-d-m')));

		if ($quote_total > 1000000000000) {
			$data['total'] = round($quote_total / 1000000000000, 1) . 'T';
		} elseif ($quote_total > 1000000000) {
			$data['total'] = round($quote_total / 1000000000, 1) . 'B';
		} elseif ($quote_total > 1000000) {
			$data['total'] = round($quote_total / 1000000, 1) . 'M';
		} elseif ($quote_total > 1000) {
			$data['total'] = round($quote_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $quote_total;
		}


		$data['daily'] =  $this->model_service_quotations->getTotalQuotes(array('filter_date_since_added' => $today_date));

		$data['quote'] = $this->url->link('service/quotations', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/packaged.tpl', $data);
	}
}
