import React from 'react';

import gql from "graphql-tag";

import { Query } from 'react-apollo';
import { Error } from './error';
import { Loading } from './loading';

import { BrowserRouter as Router, Link, Route } from 'react-router-dom';

const GET_FESTIVALS = gql`
{
  festivals {
    edges {
      node {
        id
        name
      }
    }
  }
}
`;

export class Festivals extends React.Component {
  render() {
    return (
      <Router>
        <div>
          <Query query = { GET_FESTIVALS }>
            {({ loading, error, data }) => {
              if (loading) return <Loading />;
              if (error) return <Error />;

              return (
                <ol>
                  {
                    data.festivals.edges.map((fest, idx) => (
                      <li key={ idx }>
                        <Link to={ `/festival/${fest.node.id}` }>{ fest.node.name }</Link>
                      </li>
                    ))
                  }
                </ol>
              )
            }}
          </Query>
        </div>
      </Router>
    );
  }
}
