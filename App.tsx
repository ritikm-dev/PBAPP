import React from 'react';
import {
  StatusBar,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity,
  useColorScheme,
} from 'react-native';

import { SafeAreaProvider } from 'react-native-safe-area-context';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import Login from './Login'; 

const Stack = createNativeStackNavigator();

function HomeScreen({ navigation }:any ) {
  const isDarkMode = useColorScheme() === 'dark';

  return (
    <View style={styles.container}>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <Image
        source={require('./assets/pbapp-logo.png')}
        style={{ height: 100, width: 100 }}
      />
      <Text style={styles.text}>
        Attendance {'\n'} And{'\n'} Gamified Learning App
      </Text>
      <TouchableOpacity
        style={styles.button}
        onPress={() => navigation.navigate('Login')}
      >
        <Text style={styles.buttonText}>GET STARTED</Text>
      </TouchableOpacity>
    </View>
  );
}

export default function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Stack.Navigator initialRouteName="Home">
          <Stack.Screen name="Home" component={HomeScreen} />
          <Stack.Screen name="Login" component={Login} />
        </Stack.Navigator>
      </NavigationContainer>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: {
    fontSize: 20,
    textAlign: 'center',
  },
  button: {
    margin: 12,
    backgroundColor: 'lightgreen',
    height: 40,
    width: 200,
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 8,
    borderWidth: 1,
  },
  buttonText: {
    color: 'black',
    fontSize: 16,
    fontWeight: 'bold',
  },
});
