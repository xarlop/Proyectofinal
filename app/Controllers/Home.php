<?php namespace App\Controllers;

class Home extends BaseController
{
	public function index($locale = '')
	{
		if ($locale === '') {
			
            return redirect()->to($this->locale);
			
		}
		
        $this->request->setLocale($locale);
		
		session()->set('locale', $locale);
		
        return view("Home/index");
	}

	public function testEmail()
	{
        $email = service('email');
		
        $email->setTo('leopoldoxarxar@gmail.com');
		
        $email->setSubject('A test email');
		
        $email->setMessage('<h1>proyecto 2024</h1>');
		
        if ($email->send()) {
		
            echo "Message sent";
			
		} else {
		
            echo $email->printDebugger();
			
		}
	}
}