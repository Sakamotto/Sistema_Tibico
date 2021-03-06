/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dominio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sakamoto
 */
public class CrudCurso extends javax.swing.JFrame {

    /**
     * Creates new form CrudCurso
     */
    public CrudCurso() {
        initComponents();
        pupulaComboAreaConhecimento();
        popularTabela();
    }
    
    Connection con;
    PreparedStatement ps;
    ResultSet result;
    
    public void popularTabela(){
        DefaultTableModel modelo = new DefaultTableModel();
        tabelaInf.setModel(modelo);
        modelo.addColumn("ID");
        modelo.addColumn("Curso");
        modelo.addColumn("Sigla");
        modelo.addColumn("Duração");
        modelo.addColumn("Área de Conhecimento");        
        con = Conexao.getConnection();
        try {
            ps = con.prepareStatement("SELECT *  FROM curso INNER JOIN areaconhecimento ac ON (curso.areaconhecimento_id = ac.areaconhecimento_id)\n" +
                                        "INNER JOIN grauinstrucao gi ON (curso.grauInstrucao_id = gi.grauInstrucao_id) "
                                        + "ORDER BY nome_curso");
            result = ps.executeQuery();
            // nome_curso, sigla, duracao, ac.descricao
            while(result.next()){
                int id = result.getInt("curso.curso_id");
                String curso = result.getString("nome_curso");
                String sigla = result.getString("sigla");
                int duracao = result.getInt("duracao");
                String desc = result.getString("ac.descricao");
                modelo.addRow(new Object[]{id, curso, sigla, duracao, desc});
            }
        } catch (SQLException ex) {
            Logger.getLogger(CrudCurso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void pupulaComboAreaConhecimento(){
        try {
            con = Conexao.getConnection();
            ps = con.prepareStatement("SELECT areaconhecimento_id, descricao FROM areaconhecimento");
            result = ps.executeQuery();
            while(result.next()){
                cbAreaC.addItem(result.getString("descricao"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CrudCurso.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTextField2 = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        tfCurso = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        tfSigla = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        cbRegime = new javax.swing.JComboBox();
        jLabel4 = new javax.swing.JLabel();
        tfDuracao = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        cbGrauI = new javax.swing.JComboBox();
        jLabel6 = new javax.swing.JLabel();
        cbAreaC = new javax.swing.JComboBox();
        jLabel7 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        taDescricao = new javax.swing.JTextArea();
        btSalvar = new javax.swing.JButton();
        btEditar = new javax.swing.JButton();
        btDeletar = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        tabelaInf = new javax.swing.JTable();

        jTextField2.setText("jTextField2");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Nome:");

        tfCurso.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tfCursoActionPerformed(evt);
            }
        });

        jLabel2.setText("Sigla:");

        jLabel3.setText("Regime:");

        cbRegime.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Seriado", "Créditos" }));

        jLabel4.setText("Duração:");

        tfDuracao.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tfDuracaoActionPerformed(evt);
            }
        });

        jLabel5.setText("Grau Instrução:");

        cbGrauI.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Técnico", "Superior", "Pós-Graduação", "Mestrado", "Doutorado" }));

        jLabel6.setText("Area Conhecimento:");

        jLabel7.setText("Descrição:");

        taDescricao.setColumns(20);
        taDescricao.setRows(5);
        jScrollPane1.setViewportView(taDescricao);

        btSalvar.setText("Salvar");
        btSalvar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btSalvarActionPerformed(evt);
            }
        });

        btEditar.setText("Editar");
        btEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btEditarActionPerformed(evt);
            }
        });

        btDeletar.setText("Deletar");
        btDeletar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btDeletarActionPerformed(evt);
            }
        });

        tabelaInf.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "ID", "Curso", "Sigla", "Duração", "Área de Conhecimento"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        tabelaInf.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tabelaInfMouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(tabelaInf);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(cbGrauI, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(tfCurso, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(tfDuracao)))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(tfSigla, javax.swing.GroupLayout.PREFERRED_SIZE, 86, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(cbRegime, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel6)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(cbAreaC, javax.swing.GroupLayout.PREFERRED_SIZE, 230, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addComponent(jLabel7)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btSalvar)
                        .addGap(18, 18, 18)
                        .addComponent(btEditar)
                        .addGap(18, 18, 18)
                        .addComponent(btDeletar))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addComponent(jScrollPane3, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 600, Short.MAX_VALUE)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(tfCurso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(tfSigla, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3)
                    .addComponent(cbRegime, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(cbGrauI, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6)
                    .addComponent(cbAreaC, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(tfDuracao, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jLabel7)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 93, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btSalvar)
                    .addComponent(btEditar)
                    .addComponent(btDeletar))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tfCursoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tfCursoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tfCursoActionPerformed

    private void tfDuracaoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tfDuracaoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tfDuracaoActionPerformed

    private void btSalvarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btSalvarActionPerformed
        // TODO add your handling code here:
        try {
            con = Conexao.getConnection();
            
            ps = con.prepareStatement("SELECT areaconhecimento_id FROM areaconhecimento WHERE descricao like ?");
            ps.setString(1, cbAreaC.getSelectedItem().toString());
            result = ps.executeQuery();
            int id = 3;
            while(result.next()){
                id = result.getInt(1);
            }
            
            ps = con.prepareStatement("INSERT INTO curso(nome_curso, sigla, regime, descricao, duracao, grauInstrucao_id, areaconhecimento_id )"
                    + " VALUES(?,?,?,?,?,?,?)");
            ps.setString(1, tfCurso.getText());
            ps.setString(2, tfSigla.getText());
            ps.setString(3, cbRegime.getSelectedItem().toString());
            ps.setString(4, taDescricao.getText());
            ps.setInt(5, Integer.parseInt(tfDuracao.getText()));
            ps.setInt(6, cbGrauI.getSelectedIndex() + 1);
            ps.setInt(7, id);
            
            int res = ps.executeUpdate();
            
            if(res > 0){
                JOptionPane.showMessageDialog(null,"Cadastro efetuado com sucesso!");
                System.out.println("Dados salvos com sucesso!");
            }else{
                System.out.println("Erro ... Oops! :(");
            }
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(CrudCurso.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }//GEN-LAST:event_btSalvarActionPerformed

    private void tabelaInfMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tabelaInfMouseClicked
        // TODO add your handling code here:
        int index = tabelaInf.getSelectedRow();
        int id = Integer.parseInt(tabelaInf.getModel().getValueAt(index, 0).toString());
        con = Conexao.getConnection();
        try {
            ps = con.prepareStatement("SELECT * FROM curso INNER JOIN areaconhecimento ac "
                    + "ON (curso.areaconhecimento_id = ac.areaconhecimento_id)WHERE curso_id = ?");
            ps.setInt(1, id);
            result = ps.executeQuery();
            
            while(result.next()){
                tfCurso.setText(result.getString("nome_curso"));
                tfSigla.setText(result.getString("sigla"));
                tfDuracao.setText(Integer.toString(result.getInt("duracao")));
                taDescricao.setText(result.getString("descricao"));
                cbRegime.setSelectedItem(result.getString("regime"));
                cbGrauI.setSelectedIndex(result.getInt("grauinstrucao_id") - 1);
                cbAreaC.setSelectedItem(result.getString("ac.descricao"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CrudCurso.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }//GEN-LAST:event_tabelaInfMouseClicked

    private void btEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btEditarActionPerformed
        // TODO add your handling code here:
        con = Conexao.getConnection();
        int index = tabelaInf.getSelectedRow();
        int id = Integer.parseInt(tabelaInf.getModel().getValueAt(index, 0).toString());
        int areaconhecimentoID = 3;
        try {
            ps = con.prepareStatement("SELECT areaconhecimento_id FROM areaconhecimento WHERE descricao like ?");
            ps.setString(1, cbAreaC.getSelectedItem().toString());
            result = ps.executeQuery();
            
            while(result.next()){
                areaconhecimentoID = result.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CrudCurso.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        try {
            ps = con.prepareStatement("UPDATE curso SET nome_curso = ?, sigla = ?, regime = ?, descricao = ?, duracao = ?, "
                + "grauInstrucao_id = ?, areaconhecimento_id = ? WHERE curso_id = ?");
            
            ps.setString(1, tfCurso.getText());
            ps.setString(2, tfSigla.getText());
            ps.setString(3, cbRegime.getSelectedItem().toString());
            ps.setString(4, taDescricao.getText());
            ps.setInt(5, Integer.parseInt(tfDuracao.getText()));
            ps.setInt(6, cbGrauI.getSelectedIndex() + 1);
            ps.setInt(7, areaconhecimentoID);
            ps.setInt(8, id);
            
            int res = ps.executeUpdate();
            
            if(res > 0){
                JOptionPane.showMessageDialog(null,"Registro atualizado com sucesso!");
                System.out.println("Dados salvos com sucesso!");
            }else{
                System.out.println("Erro ... Oops! :(");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CrudCurso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btEditarActionPerformed

    private void btDeletarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btDeletarActionPerformed
        // TODO add your handling code here:
        con = Conexao.getConnection();
        int index = tabelaInf.getSelectedRow();
        int id = Integer.parseInt(tabelaInf.getModel().getValueAt(index, 0).toString());
        try {
            ps = con.prepareStatement("DELETE FROM curso WHERE curso_id = ?");
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if(i > 0){
                JOptionPane.showMessageDialog(null, "Registro deletado com sucesso!");
            }
            popularTabela();
        } catch (SQLException ex) {
            Logger.getLogger(CrudCurso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btDeletarActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(CrudCurso.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(CrudCurso.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(CrudCurso.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(CrudCurso.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new CrudCurso().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btDeletar;
    private javax.swing.JButton btEditar;
    private javax.swing.JButton btSalvar;
    private javax.swing.JComboBox cbAreaC;
    private javax.swing.JComboBox cbGrauI;
    private javax.swing.JComboBox cbRegime;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextArea taDescricao;
    private javax.swing.JTable tabelaInf;
    private javax.swing.JTextField tfCurso;
    private javax.swing.JTextField tfDuracao;
    private javax.swing.JTextField tfSigla;
    // End of variables declaration//GEN-END:variables
}
