import React from 'react';

import gql from "graphql-tag";

import { Query } from 'react-apollo';
import { Error } from './error';
import { Loading } from './loading';

import { Link } from 'react-router-dom';

import { Festival } from './festival';

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
      <div>
        <Query query = { GET_FESTIVALS }>
          {({ loading, error, data }) => {
            if (loading) return <Loading />;
            if (error) return <Error />;

            return (
              <ol>
                {
                  data.festivals.edges.map((fest, idx) => (
                    <li key={ fest.index }>
                      <Link to={ `/festival/${fest.node.id}` }>{ fest.node.name }</Link>
                    </li>
                  ))
                }
              </ol>
            )
          }}
        </Query>
      </div>
    );
  }
}
