<?php
class ControllerCommonStats extends Controller {
	public function index() {
		$this->load->language('common/stats');

		$data['text_complete_status'] = $this->language->get('text_booking_received');
		$data['text_processing_status'] = $this->language->get('text_booking_in_transit');
		$data['text_other_status'] = $this->language->get('text_container_capacity');

		$data['text_booking_received'] = $this->language->get('text_booking_received');
		$data['text_booking_in_transit'] = $this->language->get('text_booking_in_transit');
		$data['text_container_capacity'] = $this->language->get('text_container_capacity');

		$this->load->model('sale/order');

		$order_total = $this->model_sale_order->getTotalOrders();
		//$this->session->data['booking_statuses_test']=  $booking_total = $this->model_service_booking->getTotalBookings(array('filter_status' => implode(',', $this->config->get('config_processing_status_lcl'))));


		//$complete_total = $this->model_service_booking->getTotalBookings(array('filter_status' => implode(',', $this->config->get('config_processing_status_booking'))));
$complete_total = null;
$processing_total=null;
		//$this->session->data['booking_statuses_test2'] = implode(',', $this->config->get('config_processing_status_transit'));

		if ($complete_total) {
			$data['complete_status'] = round(($complete_total / $booking_total) * 100);
		} else {
			$data['complete_status'] = 0;
		}

		//$processing_total = $this->model_service_booking->getTotalBookings(array('filter_status' => implode(',', $this->config->get('config_processing_status_transit'))));

		if ($processing_total) {
			$data['processing_status'] = round(($processing_total / $booking_total) * 100);
		} else {
			$data['processing_status'] = 0;
		}

		$this->load->model('localisation/order_status');

		$order_status_data = array();

		$results = $this->model_localisation_order_status->getOrderStatuses();

		foreach ($results as $result) {
			if (!in_array($result['order_status_id'], array_merge($this->config->get('config_complete_status'), $this->config->get('config_processing_status')))) {
				$order_status_data[] = $result['order_status_id'];
			}
		}

		$other_total = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $order_status_data)));


		if ($other_total) {
			$data['other_status'] = round(($other_total / $order_total) * 100);
		} else {
			$data['other_status'] = 0;
		}

		return $this->load->view('common/stats.tpl', $data);
	}
}
