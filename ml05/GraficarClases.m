function GraficarClases(x, y)
    positivos = find(y==1);
    negativos = find(y==0);
    
    figure;
    hold on; %montar graficos sin borrar previos
    
    plot( x(positivos,1), x(positivos,2), 'k+', 'LineWidth', 2, 'MarkerSize', 6 );    
    plot( x(negativos,1), x(negativos,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 6 );
    
    hold off;
end