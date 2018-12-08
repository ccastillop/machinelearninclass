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
    
    if strcmp(TopIntent, 'Saludar')
        fprintf('\n¿En qué puedo ayudarte?\n')
        
    elseif strcmp(TopIntent, 'BuscarExpediente')
        if isempty(ret.entities)
            codigo = IngreseCodigo();
        else
            codigo = str2num(ret.entities(1).entity);
        end
        
        if codigo > 0
            idx = find(codigos == codigo)
            
            if idx > 0
                fprintf('\nLos datos del expediente son:')
                fprintf('\nSolicitante %s, en la ciudad de: %s', ...
                    solicitantes{idx}, ciudades{idx});
                fprintf('\n¿Tienes otra consulta?');
            else
                fprintf('\nEl expediente no existe\n');
            end
        end
        
    elseif strcmp(TopIntent, 'TiempoFaltante')
        if codigo == 0
            codigo = IngreseCodigo();
        end
        if codigo > 0
            idx = find(codigos == codigo);
            if idx > 0
                fprintf('\nPlazo restante para responder: %d días\n', ...
                    plazos(idx));
            else
                fprintf('\nEl expediente no existe\n');
            end
        end
        
    else
        fprintf('\nHa sido un gusto atenderle\n');
        return;
    end
end

    