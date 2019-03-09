import React from 'react';

import gql from "graphql-tag";

import { Query } from 'react-apollo';
import { Error } from './error';
import { Loading } from './loading';
import { User } from './user';

import { BrowserRouter as Router, Link, Route } from 'react-router-dom';

const GET_USERS = gql`
  {
    users {
      id
      handle
      email
    }
  }
`;

export class Users extends React.Component {
  render() {
    return (
      <Router>
        <div>
          <Query query = { GET_USERS }>
            {({ loading, error, data }) => {
              if (loading) return <Loading />;
              if (error) return <Error />;

              const users = data.users;

              return (
                <ol>
                  {
                    users.map((user) => (
                      <li key={ user.index }>
                        <Link to={ `/users/${user.id}` }>{ user.handle }</Link>
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
