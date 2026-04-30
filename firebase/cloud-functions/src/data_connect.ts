import { getDataConnect } from 'firebase-admin/data-connect';

const dc = getDataConnect({
  location: 'europe-southwest1',
  serviceId: 'biuti-database-service',
});

export async function executeQuery<T>(gql: string, variables: Record<string, unknown>): Promise<T> {
  const result = await dc.executeGraphqlRead<T, Record<string, unknown>>(gql, { variables });
  return result.data;
}

export async function executeMutation<T>(gql: string, variables: Record<string, unknown>): Promise<T> {
  const result = await dc.executeGraphql<T, Record<string, unknown>>(gql, { variables });
  return result.data;
}
