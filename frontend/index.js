import React from 'react';
import ReactDOM from 'react-dom';

import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";

import {
  BrowserRouter as Router
} from 'react-router-dom';

import { Users } from './src/components/users';

class GraphQLExample extends React.Component {
  constructor() {
    super();

    this.client = new ApolloClient({
      uri: "http://localhost:8888/api/graph"
    });
  }

  render() {
    return (
      <Router>
        <ApolloProvider client={ this.client }>
          <h1>Festival App</h1>
          <Users />
        </ApolloProvider>
      </Router>
    );
  }
}

ReactDOM.render(<GraphQLExample />, document.getElementById('app'));
