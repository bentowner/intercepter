<?php
class ControllerCommonLogout extends Controller {
	public function index() {
		$this->user->logout();

		unset($this->session->data['token']);
		// Finally, destroy the session.
		session_destroy();

		$this->response->redirect($this->url->link('common/login', '', 'SSL'));
	}
}