package com.example.pdrmadgwick

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import com.example.pdrmadgwick.ui.theme.PDRMadgwickTheme


class MainActivity : ComponentActivity() {

    private val viewModel: NavigationViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Inicia a escuta dos sensores via ViewModel
        viewModel.initSensors(this)

        setContent {
            PDRMadgwickTheme {
                NavigationScreen(viewModel = viewModel)
            }
        }
    }

    override fun onResume() {
        super.onResume()
        // O ViewModel cuida do registro/desregistro se necessário, 
        // mas aqui garantimos que os sensores estão ativos ao voltar ao app.
        viewModel.initSensors(this)
    }
}
