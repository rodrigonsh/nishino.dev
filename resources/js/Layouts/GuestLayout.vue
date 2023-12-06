<script>

export default {

    data: () => ({
      drawer: (window.innerWidth > 600),
    }),

}

</script>

<script setup>

    import { Link } from '@inertiajs/vue3';

    import { useAppStore } from './../store.js'

    import { computed } from 'vue'

    const store = useAppStore()

    const getLang = computed( function()
    {
        return store.lang
    })

    const changeLang = function()
    {
        store.toggleLang()
    }

    defineProps({
        canLogin: Boolean,
        canRegister: Boolean,
        title: String,
    });

    function fabClicked()
    {
        window.location = "https://api.whatsapp.com/send?phone=5567981849417"
    }

    const getClienteTrans = computed(function()
    {
        let trans = {
            'pt': "Área do cliente",
            'en': "Client Area",
            'es': "Clientes",
        }

        return trans[store.lang]
    })

    const getAboutTrans = computed(function()
    {
        let trans = {
            'pt': "Saiba Mais",
            'en': "About me",
            'es': "Acerca",
        }

        return trans[store.lang]
    })

    const getContactTrans = computed(function()
    {
        let trans = {
            'pt': "Contato",
            'en': "Call me",
            'es': "Cuenta conmigo",
        }

        return trans[store.lang]
    })

    

</script>


<template>

    <v-app :lang="store.lang">

    <v-navigation-drawer color="surf" v-model="drawer">
        <v-container class="pa-5 d-flex flex-column ">

            <Link id="menuLogo" href="/" class="d-block w-75 my-6 mx-auto">
                <img src="/img/logo-nsh.svg" class="app-logo d-block w-100 mb-3" />

                <span lang="pt" class="text-center">Consultoria & Desenvolvimento</span>
                <span lang="en" class="text-center">Consultancy & Development </span>
                <span lang="es" class="text-center">Consultoría & Desarrollo</span>

            </Link>

            

            <v-list density="compact" nav>

                <Link href="/cliente">

                <v-list-item 
                    prepend-icon="mdi-account"
                    :title="getClienteTrans"
                    :ripple="true"
                    link
                ></v-list-item>

                </Link>

                <v-divider />
                
                <Link href="/about">

                    <v-list-item 
                        prepend-icon="mdi-information"
                        :title="getAboutTrans"
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

                <Link href="/harvey">
                <v-list-item 
                    prepend-icon="mdi-message"
                    :title="getContactTrans"
                    :ripple="true"
                ></v-list-item>
                </Link>

            </v-list>            

            <v-divider class="mb-5"></v-divider>

            
            
            <small>

                <p>
                    <strong>NISHINO LTDA</strong><br />
                    48.129.023/0001-27
                </p>
                
                <p>
                    Avenida Afluente, 1070<br/> 
                    Vila Fernanda<br/>
                    Campo Grande / MS<br />
                    79096-149
                </p>
                
                

            </small>

        </v-container>
    </v-navigation-drawer>

    <v-app-bar class="bg-nishino">

        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

        <v-app-bar-title>
            {{ title }}
        </v-app-bar-title>

        <v-spacer></v-spacer>

        <v-btn variant="outlined"  @click="changeLang">
            <v-icon icon="mdi-translate" class="mr-3"></v-icon>
            {{ getLang }}
        </v-btn>
                                  

    </v-app-bar>


    <v-main class="bg-forest">
        <slot />

        <v-container class="bg-footer">
            <strong>NISHINO LTDA</strong><br />
            48.129.023/0001-27
        </v-container>

    </v-main>

    </v-app>


</template>
