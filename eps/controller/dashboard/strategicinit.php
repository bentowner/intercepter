<?php
class ControllerDashboardStrategicinit extends Controller {
	public function index() {
		$this->load->language('dashboard/strategicinit');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Bookings

		$this->load->model('service/eps');

		$today = new datetime();
		$newTZ = new DateTimeZone("America/New_York");
		$today->setTimezone( $newTZ );
		$today_date = $today->format('Y-m-d');

		$today = $this->model_service_eps->getTotalStrategic(array('filter_date_added' => $today_date));

		$yesterday = $this->model_service_eps->getTotalStrategic(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$date_till = new datetime('2015-01-01');

		$booking_total = $this->model_service_eps->getTotalStrategic(array('filter_date_since_added' => $date_till->format('Y-d-m')));

		if ($booking_total > 1000000000000) {
			$data['total'] = round($booking_total / 1000000000000, 1) . 'T';
		} elseif ($booking_total > 1000000000) {
			$data['total'] = round($booking_total / 1000000000, 1) . 'B';
		} elseif ($booking_total > 1000000) {
			$data['total'] = round($booking_total / 1000000, 1) . 'M';
		} elseif ($booking_total > 1000) {
			$data['total'] = round($booking_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $booking_total;
		}

		$data['daily'] =  $this->model_service_eps->getTotalStrategic(array('filter_date_since_added' => $today_date));

		$data['booking'] = $this->url->link('service/booking', 'token=' . $this->session->data['token'], 'SSL');
		$this->session->data['booking_link']= $data['booking_link']= $this->url->link('service/booking/update', 'token=' . $this->session->data['token'].'&booking_no=', 'SSL');

		return $this->load->view('dashboard/strategic.tpl', $data);
	}

	public function getBooking(){
		if (isset($this->request->get['booking_no'])) {
			$booking_no = $this->request->get['booking_no'];

			$this->load->model('service/eps');

			$results = $this->model_service_eps->getBookings(array('filter_booking_id'=> $booking_no));
			$hasBooking =true;
			if (sizeof($results) < 1){
			$hasBooking = "No Booking found, try again!";
			}
		} else {
			$hasBooking = "No Booking number entered, try again!";
		}

		$this->response->setOutput($hasBooking);

	}



}
