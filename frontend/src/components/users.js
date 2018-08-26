import React from 'react';

import gql from "graphql-tag";

import { Query } from 'react-apollo';

const GET_USERS = gql`
  {
    users {
      id
      handle
      email
    }
  }
`;

export default class Users extends React.Component {
  render() {
    return (
      <Query query={GET_USERS}>
        {({ loading, error, data }) => {
          if (loading) return <div>Loading...</div>;
          if (error) return <div>Error :(</div>;

          const users = data.users;

          return (
            <div>
              {
                users.map(user => (
                  <div>hello { user.email }</div>
                ))
              }
            </div>
          )
        }}
      </Query>
    );
  }
}
