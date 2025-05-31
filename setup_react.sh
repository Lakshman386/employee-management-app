#!/bin/bash

BASE_DIR="ReactJS-SpringBoot-EMS"

echo "Creating frontend React files..."

# App.js
cat <<EOF > $BASE_DIR/frontend/src/App.js
import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import HeaderComponent from './components/HeaderComponent';
import FooterComponent from './components/FooterComponent';
import ListEmployeeComponent from './components/ListEmployeeComponent';
import CreateEmployeeComponent from './components/CreateEmployeeComponent';
import ViewEmployeeComponent from './components/ViewEmployeeComponent';

function App() {
  return (
    <Router>
      <HeaderComponent />
      <div className="container">
        <Switch>
          <Route exact path="/" component={ListEmployeeComponent} />
          <Route path="/employees" component={ListEmployeeComponent} />
          <Route path="/add-employee/:id" component={CreateEmployeeComponent} />
          <Route path="/view-employee/:id" component={ViewEmployeeComponent} />
        </Switch>
      </div>
      <FooterComponent />
    </Router>
  );
}

export default App;
EOF

# EmployeeService.js
cat <<EOF > $BASE_DIR/frontend/src/services/EmployeeService.js
import axios from 'axios';

const EMPLOYEE_API_BASE_URL = "http://localhost:8080/api/v1/employees";

class EmployeeService {
  getEmployees() {
    return axios.get(EMPLOYEE_API_BASE_URL);
  }
  createEmployee(employee) {
    return axios.post(EMPLOYEE_API_BASE_URL, employee);
  }
  getEmployeeById(employeeId) {
    return axios.get(\`\${EMPLOYEE_API_BASE_URL}/\${employeeId}\`);
  }
  updateEmployee(employee, employeeId) {
    return axios.put(\`\${EMPLOYEE_API_BASE_URL}/\${employeeId}\`, employee);
  }
  deleteEmployee(employeeId) {
    return axios.delete(\`\${EMPLOYEE_API_BASE_URL}/\${employeeId}\`);
  }
}

export default new EmployeeService();
EOF

echo "✅ React App.js and EmployeeService.js generated."
