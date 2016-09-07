<?php
class ControllerDashboardDealsupport extends Controller {
	public function index() {
		$this->load->language('dashboard/dealsupport');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Customers
		$this->load->model('maintenance/customer');

		$today = $this->model_maintenance_customer->getTotalCustomers(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

		$yesterday = $this->model_maintenance_customer->getTotalCustomers(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$date_till = new datetime('2015-01-01');

		$customer_total = $this->model_maintenance_customer->getTotalCustomers(array('filter_since_date_added' => $date_till->format('Y-m-d')));

		if ($customer_total > 1000000000000) {
			$data['total'] = round($customer_total / 1000000000000, 1) . 'T';
		} elseif ($customer_total > 1000000000) {
			$data['total'] = round($customer_total / 1000000000, 1) . 'B';
		} elseif ($customer_total > 1000000) {
			$data['total'] = round($customer_total / 1000000, 1) . 'M';
		} elseif ($customer_total > 1000) {
			$data['total'] = round($customer_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $customer_total;
		}

		$data['customer'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/customer.tpl', $data);
	}
}
