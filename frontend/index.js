import React from 'react';
import ReactDOM from 'react-dom';

import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";

import {
  BrowserRouter as Router,
  Route,
  Switch,
} from 'react-router-dom';

import { Users } from './src/components/users';
import { NewFestival } from './src/components/festival';

class GraphQLExample extends React.Component {
  constructor() {
    super();

    this.client = new ApolloClient({
      uri: "http://localhost/api/graph"
    });
  }

  render() {
    return (
      <Router>
        <ApolloProvider client={ this.client }>
          <Switch>
            <div className="container">
              <Route exact path="/" component={ Users } />
              <Route path="/festivals/new" component={ NewFestival } />
            </div>
          </Switch>
        </ApolloProvider>
      </Router>
    );
  }
}

ReactDOM.render(<GraphQLExample />, document.getElementById('app'));
