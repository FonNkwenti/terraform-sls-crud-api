'use strict';

export async function handler(event) {
  return {
    statusCode: 200,
    headers: {
      'Access-Control-Allow-Origin': '*'
    },
    body: JSON.stringify(
      {
        message: 'Your function executed successfully!'
      },
      null,
      2
    ),
  };
}