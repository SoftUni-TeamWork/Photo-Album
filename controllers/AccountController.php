<?php

class AccountController extends BaseController {
    private $db;

    public function onInit() {
        $this->db = new AccountModel();
    }

    public function register() {
        if ($this->isPost) {
            $username = $_POST['username'];

            if(!$username || mb_strlen($username) < 3) {
                $this->addErrorMessage('Username is invalid');
                $this->redirect('account', 'register');
            }


            $password = $_POST['password'];
            $isRegistered = $this->db->register($username, $password);

            if ($isRegistered) {
                $_SESSION['username'] = $username;
                $this->redirectToUrl('/');
            } else {
                $this->addErrorMessage('Register failed.');
            }
        }

        $this->renderView(__FUNCTION__);
    }

    public function login() {
        if($this->isPost) {
            $username = $_POST['username'];
            $password = $_POST['password'];

            $isLoggedIn = $this->db->login($username, $password);

            if($isLoggedIn) {
                $_SESSION['username'] = $username;
                $this->addInfoMessage('Successful login');
                $this->redirect('books', 'index');
            } else {
                $this->addErrorMessage('Login failed');
                $this->redirect('account', 'login');
            }
        }

        $this->renderView(__FUNCTION__);
    }

    public function logout() {
        unset($_SESSION['username']);
        $this->addInfoMessage('Successfully logout');
        $this->redirectToUrl('/');
    }
}