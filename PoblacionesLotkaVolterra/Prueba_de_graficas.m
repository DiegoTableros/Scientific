Conejos=[30 47.2 70.2 77.4 36.3 20.6 18.1 21.4 22 25.4 27.1 40.3 57 76.6 52.3 19.5 11.2 7.6 14.6 16.2 24.7]
Linces=[4 6.1 9.8 35.2 59.4 41.7 19 13 8.3 9.1 7.4 8 12.3 19.5 45.7 51.1 29.7 15.8 9.7 10.1 8.6]
Tiempo=[1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920]
plot(Tiempo, Conejos, '-o', Tiempo, Linces, '-O', 'LineWidth',2)
%title('Poblaciones de linces y conejos','fontsize',34)
xlabel('Tiempo [años]','fontsize',14)
ylabel('Población [miles]','fontsize',14)
legend('Conejos','Linces')