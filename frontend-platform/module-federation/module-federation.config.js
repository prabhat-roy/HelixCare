// Module Federation across HelixCare frontends (storefront / admin / partner / mobile-web)
const { ModuleFederationPlugin } = require("@module-federation/enhanced/webpack");
module.exports = {
  plugins: [
    new ModuleFederationPlugin({
      name: "helixcare_shell",
      remotes: {
        admin: "admin@https://admin.helixcare.internal/remoteEntry.js",
        partner: "partner@https://partner.helixcare.internal/remoteEntry.js",
      },
      shared: { react: { singleton: true }, "react-dom": { singleton: true } },
    }),
  ],
};
