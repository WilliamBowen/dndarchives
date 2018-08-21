import axios from 'axios'

export default() => {
  return axios.create({
    baseURL: 'dndarchives-server.herokuapp.com'
  })
}
