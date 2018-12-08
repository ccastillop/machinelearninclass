codigos = [123, 124, 125];
solicitantes = { 'Carlos Manrique', 'María Rojas Sánchez', 'Lucía de la Cruz' };
ciudades = {'Lima', 'Trujillo', 'Chiclayo'};
plazos = [7, 3, 12];

codigo = 0;
fprintf('Hola\n');

endpoint = 'https://westus.api.cognitive.microsoft.com/luis/v2.0/apps/d92fc28d-b86d-4671-b826-0a0642aba271?subscription-key=113b43a9974b47c3b911273441c98051&verbose=true&timezoneOffset=-360';

while (1)
    entrada = input('', 's');
    ret = webread(endpoint, 'q', entrada);
    TopIntent = ret.topScoringIntent.intent;
    score = ret.topScoringIntent.score;
    
    if strcmp(TopIntent, 'None')
        continue;
    end
    
    if score < 0.2
        continue;
    end
    
    