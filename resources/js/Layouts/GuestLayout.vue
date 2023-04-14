<script>

export default {

    data: () => ({
      drawer: (window.innerWidth > 600),
    }),

}

</script>

<script setup>

    import { Link } from '@inertiajs/vue3';

    defineProps({
        canLogin: Boolean,
        canRegister: Boolean,
        title: String,
    });

    function fabClicked()
    {
        window.location = "https://api.whatsapp.com/send?phone=5567998711219"
    }

</script>


<template>

    <v-app>

    <v-navigation-drawer color="surf" v-model="drawer">
        <v-container class="pa-5 d-flex flex-column ">

            <Link href="/" class="d-block w-75 my-6 mx-auto">
                <img src="/img/logo-nsh.svg" class="app-logo d-block w-100 mb-3" />
                <span class="d-block text-center">Desenvolvimento e Consultoria</span>
            </Link>

            <v-card class="w-100 mb-6">

                <v-list lines="one">
                    
                    <Link href="/about">
                    <v-list-item 
                        prepend-icon="mdi-information"
                        title="Saiba Mais"
                        :ripple="true"
                        link
                    ></v-list-item>
                    </Link>

                    <v-divider />

                    <Link href="/blog">
                    <v-list-item 
                        prepend-icon="mdi-post"
                        title="Blog"
                        :ripple="true"
                    ></v-list-item>
                    </Link>

                    <v-divider />

                    <Link href="/contato">
                    <v-list-item 
                        prepend-icon="mdi-message"
                        title="Contato"
                        :ripple="true"
                    ></v-list-item>
                    </Link>

                </v-list>

            </v-card>

            <v-divider class="mb-5"></v-divider>

            <p class="w-100 mb-2">
                <v-btn variant="outlined" class="d-block w-100 bg-primary text-white">
                    <a href="https://api.whatsapp.com/send?phone=5567998711219" target="_blank">
                        <v-icon icon="mdi-whatsapp"></v-icon>
                        Whatsapp
                    </a>
                </v-btn>
            </p>
            
            <p class="w-100">
                <v-btn variant="tonal" class="d-block w-100">
                    <a href="mailto:rodrigo.nsh@gmail.com" target="_blank">
                        <v-icon icon="mdi-email-outline"></v-icon>
                        Email
                    </a>
                </v-btn>
            </p>
            
            <small>

                <p><strong>RODRIGO CALANCA NISHINO LTDA</strong></p>

                <p>48.129.023/0001-27</p>
                
                <p>
                    Avenida Afluente, 1070<br/> 
                    Vila Fernanda<br/>
                    Campo Grande / MS<br />
                    79096-149
                </p>
                
                

            </small>

        </v-container>
    </v-navigation-drawer>

    <v-app-bar class="bg-pokedex">

        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

        <v-app-bar-title>
            {{ title }}
        </v-app-bar-title>
                                  

    </v-app-bar>


    <v-main class="bg-forest">
        <slot />

        <VLayoutItem model-value position="bottom" class="text-end" size="88">
        <div class="ma-4">
            <v-btn icon="mdi-whatsapp" @click="fabClicked" size="large" color="green" elevation="8" />
        </div>
        </VLayoutItem>

    </v-main>

    </v-app>


</template>
