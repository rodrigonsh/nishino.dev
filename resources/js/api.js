import axios from 'axios'

const api = 
{    
    token: null,

    async getToken()
    {
        let res = await axios.get('/token',{ withCredentials: true })
        
        api.token = res.data.token

        axios.defaults.headers.common['Access-Control-Allow-Headers'] = "*"
        axios.defaults.headers.common['Access-Control-Allow-Origin'] = "*"

        axios.defaults.headers.common['X-CSRF-TOKEN'] = api.token
        axios.defaults.headers.common['CSRF-Token'] = api.token

    },

    converterLead(obj)
    {
        let partes = ['', 'admin', 'leads', obj.id, 'converter']

        return axios.get( partes.join('/') , obj, {
            withCredentials: true
        })
    },

    descartarLead(obj)
    {
        let partes = ['', 'admin', 'leads', obj.id, 'descartar']

        return axios.get( partes.join('/') , obj, {
            withCredentials: true
        })
    },

}


export default api
