import React from "react";
import gql from "graphql-tag";

import { Query } from 'react-apollo';
import { Error } from './error';
import { Loading } from './loading';

const GET_MESSAGES = gql`
query {
  workerMessages {
    message
  }
}
`;

export class Admin extends React.Component {
  render() {
    return (<Query query = { GET_MESSAGES }>
      {({ loading, error, data }) => {
          if (loading) return <Loading />;
          if (error) return <Error />;

          const messages = data.workerMessages;

          return (
            <div>
              { messages.map((m) => {
                return (
                  <div>{ m.message }</div>
                );
              })}
            </div>
          );
        }}
      </Query>
    );
  }
}
