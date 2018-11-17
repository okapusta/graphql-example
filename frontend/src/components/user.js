import React from "react";
import gql from "graphql-tag";

import { Query } from 'react-apollo';
import { Error } from './error';
import { Loading } from './loading';

const GET_USER = gql`
  query User($id: Int!) {
    user(id: $id) {
      id
      handle
      email

      festivals {
        id
        name
        place
      }
    }
  }
`;

export class User extends React.Component {
  constructor(props) {
    super(props);
    this.userId = Number(props.match.params.id);
  }
  render() {
    return (<Query query = { GET_USER } variables={ { id: this.userId } }>
      {({ loading, error, data }) => {
          if (loading) return <Loading />;
          if (error) return <Error />;

          const user = data.user;

          return (
            <div>
              <h1>{ user.handle }</h1>
              <hr />
              { user.festivals.map((fest) => {
                return (
                  <div key={ fest.id }>{ fest.name } - { fest.place }</div>
                );
              })}
            </div>
          );
        }}
      </Query>
    );
  }
}
