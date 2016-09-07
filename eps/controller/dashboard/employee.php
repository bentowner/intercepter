<?php
class ControllerDashboardEmployee extends Controller {
	public function index() {
		$this->load->language('dashboard/employee');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_day'] = $this->language->get('text_day');
		$data['text_week'] = $this->language->get('text_week');
		$data['text_month'] = $this->language->get('text_month');
		$data['text_year'] = $this->language->get('text_year');
		$data['text_view'] = $this->language->get('text_view');
		$data['text_employee'] = $this->language->get('text_employee');

		$data['token'] = $this->session->data['token'];


		$this->load->model('service/skills');

		//$employee_booking = $this->model_service_service->get30Booking();
		$skills_matrix = $this->model_service_skills->getSkills();
		$today = new datetime();

		$today = $today->format('Y-m-d');

		if ($skills_matrix){
			$json_booking = array();

			foreach ($skills_matrix as $result) {
				$action  = array();

				$action[] = array(
						'count' => $result['count_items'],
						'employee' => $result['usrname'],
						'href' => $this->url->link('service/booking', 'token=' . $this->session->data['token'] .'&filter_date_added='.$today.'&filter_bookedby=' . $result['usrid'], 'SSL'),
				);
				//$booking_link = "#"

				$booking_link = ($this->url->link('common/dashboard', 'token=' . $this->session->data['token'] .'&filter_date_added='.$today.'&filter_bookedby=' . $result['usrid'], 'SSL'));

				$data['pie_booking'][]= "['".$this->db->escape($result['usrname'])."',".$result['count_items'].",'".$booking_link."']";
				$data['pastmonth_booking'][] = array('action' => $action);
			}

		}

			$data['total_booking'] = array_sum($json_booking);

		return $this->load->view('dashboard/employee.tpl', $data);

	}





}
