function f = calc_omega_b(omegab)
facentric = 0.1931;
zeta = 0.329032 - 0.076799*(facentric)+0.0211947*(facentric^2);
f = (omegab^3)+(2-3*zeta)*(omegab^2)+3*(zeta^2)*omegab-(zeta^3);
end