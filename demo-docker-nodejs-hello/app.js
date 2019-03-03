const express = require('express')

const app = express()

const PORT_DEFAULT = 3000

const port_env = process.env.PORT || PORT_DEFAULT

app.get('/', (req, res) => res.send('Hello World!'))

app.get('/hello', async (req, res, next) => {
    console.log('info', '[APP EXPRESS] hello...' );
    res.status(200).send('Hello World!' + new Date().toTimeString())
})

app.listen(port_env, () => console.log(`[APP EXPRESS] hello app listening on port ${port_env}!`))