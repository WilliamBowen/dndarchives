import axios from 'axios'

export default() => {
  return axios.create({
    baseURL: 'http://dndarchives-server.herokuapp.com'
  })
}
