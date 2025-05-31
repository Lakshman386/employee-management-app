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
